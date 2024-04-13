//
//  Lexer.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

import Foundation
import Token

public struct Lexer {
	private let input: [UInt8]
	private var position: Int // current position in input (points to current char)
	private var readPosition: Int // current reading position in input (after current char)
	private var ch: UInt8 = .zero // current char under examination
	private var character: Character { Character(UnicodeScalar(ch)) }

	init(input: String) {
		self.input = Array(input.utf8)
		position = 0
		readPosition = 0
		readChar()
	}

	mutating func nextToken() -> Token {
		skipWhitespace()

		let token: Token
		switch character {
		case "{": token = .lSquirly
		case "}": token = .rSquirly
		case "(": token = .lParen
		case ")": token = .rParen
		case ",": token = .comma
		case ";": token = .semi
		case "+": token = .plus
		case "=": token = .equal
		case "\0": token = .eof
		case "-": token = .minus
		case "!": token = .bang
		case "*": token = .asterisk
		case "/": token = .forwardSlash
		case "<": token = .lessThan
		case ">": token = .greaterThan
		default:
			if character.isLetterOrUnderscore {
				token = Token.lookupKeywords(identifier: readIdentifier())
				return token
			} else if character.isNumber {
				token = .int(readNumber())
				return token
			} else {
				token = .illegal(String(character))
			}
		}

		readChar()
		return token
	}

	mutating func readChar() {
		if readPosition > input.index(before: input.endIndex) {
			ch = .zero
		} else {
			ch = input[readPosition]
		}

		position = readPosition
		readPosition = input.index(after: readPosition)
	}

	mutating func readIdentifier() -> String {
		let pos = position
		repeat {
			readChar()
		} while character.isLetterOrUnderscore
		return String(decoding: Array(input[pos..<position]), as: UTF8.self)
	}

	mutating func readNumber() -> String {
		let pos = position
		repeat {
			readChar()
		} while character.isNumber
		return String(decoding: Array(input[pos..<position]), as: UTF8.self)
	}

	mutating func skipWhitespace() {
		while character.isWhitespace {
			readChar()
		}
	}
}

enum LexerError: Error {
	case unexpectedCharacter(Character)
}

extension Character {
	var isLetterOrUnderscore: Bool { isLetter || self == "_" }
}
