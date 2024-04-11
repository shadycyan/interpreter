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
	private var position = 0 // current position in input (points to current char)
	private var readPosition = 0 // current reading position in input (after current char)
	private var character: UInt8 = .zero // current char under examination

	init(input: String) {
		self.input = input
	}

	func getNextToken() -> Token {
		.eof
	}
}
