//
//  Lexer.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

import Token

public struct Lexer {
	private let input: [Character]
	private var position: Int // current position in input (points to current char)
	private var readPosition: Int // current reading position in input (after current char)
	private var character: Character? = .none // current char under examination

	public init(input: String) {
		self.input = Array(input)
		position = 0
		readPosition = 0
		readChar()
	}

	public mutating func nextToken() -> Token? {
		skipWhitespace()

		guard let character else { return .none }

		let token: Token?
		switch character {
		case "=": if let ch = peekChar(), ch == "=" { readChar(); token = .equal } else { token = .assign }
		case "+": token = .plus
		case "-": token = .minus
		case "!": if let ch = peekChar(), ch == "=" { readChar(); token = .notEqual } else { token = .bang }
		case "*": token = .asterisk
		case "/": token = .forwardSlash
		case "<": token = .lessThan
		case ">": token = .greaterThan
		case ";": token = .semi
		case ",": token = .comma
		case "(": token = .lParen
		case ")": token = .rParen
		case "{": token = .lSquirly
		case "}": token = .rSquirly
		default:
			if character.isLetterOrUnderscore {
				let ident = readIdentifier()
				token = Token.keywords[ident] ?? .ident(ident)
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
		character = readPosition >= input.count ? .none : input[readPosition]
		position = readPosition
		readPosition = position + 1
	}

	func peekChar() -> Character? {
		readPosition >= input.count ? .none : input[readPosition]
	}

	mutating func readIdentifier() -> String {
		readWhile(\.character!.isLetterOrUnderscore)
	}

	mutating func readNumber() -> String {
		readWhile(\.character!.isNumber)
	}

	mutating func readWhile(_ condition: KeyPath<Lexer, Bool>) -> String {
		let posStart = position
		while self[keyPath: condition] {
			readChar()
		}
		return String(input[posStart..<position])
	}

	mutating func skipWhitespace() {
		while let character = character, character.isWhitespace {
			readChar()
		}
	}
}

extension Character {
	var isLetterOrUnderscore: Bool { isLetter || self == "_" }
}
