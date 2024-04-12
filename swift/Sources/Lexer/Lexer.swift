//
//  Lexer.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

import Foundation
import Token

public struct Lexer {
	private let input: String
	private var position: String.Index // current position in input (points to current char)
	private var readPosition: String.Index // current reading position in input (after current char)
	private var character: Character = "\0" // current char under examination

	init(input: String) {
		self.input = input
		position = input.startIndex
		readPosition = input.startIndex
		readChar()
	}

	mutating func nextToken() throws -> Token {
		defer { readChar() }

		switch character {
		case "{": return .lSquirly
		case "}": return .rSquirly
		case "(": return .lParen
		case ")": return .rParen
		case ",": return .comma
		case ";": return .semi
		case "+": return .plus
		case "=": return .equal
		case "\0": return .eof
		default:
			if character.isLetterOrUnderscore {
				return Token.lookupKeywords(identifier: readIdentifier())
			} else {
				return .illegal(String(character))
			}
		}
	}

	mutating func readChar() {
		position = readPosition

		if readPosition >= input.endIndex {
			character = "\0"
		} else {
			character = input[readPosition]
			readPosition = input.index(after: readPosition)
		}
	}

	mutating func readIdentifier() -> String {
		let pos = position
		repeat {
			readChar()
		} while character.isLetterOrUnderscore
		return String(input[pos...position])
	}
}

enum LexerError: Error {
	case unexpectedCharacter(Character)
}

extension Character {
	var isLetterOrUnderscore: Bool { isLetter || self == "_" }
}
