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

	mutating func getNextToken() throws -> Token {
		var token: Token

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
		default: throw LexerError.unexpectedCharacter(Character(UnicodeScalarType(character)))
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
}

enum LexerError: Error {
	case unexpectedCharacter(Character)
}
