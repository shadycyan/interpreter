//
//  Token.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

import Foundation

public enum Token: Equatable {
	case illegal(String)
	case eof
	case ident(String)
	case int(String)
	case assign
	case plus
	case comma
	case semi
	case lParen
	case rParen
	case lSquirly
	case rSquirly
	case function
	case `let`

	public var literal: String {
		switch self {
		case let .illegal(literal): return literal
		case .eof: return "EOF"
		case let .ident(literal): return literal
		case let .int(literal): return literal
		case .assign: return "="
		case .plus: return "+"
		case .comma: return ","
		case .semi: return ";"
		case .lParen: return "("
		case .rParen: return ")"
		case .lSquirly: return "{"
		case .rSquirly: return "}"
		case .function: return "fn"
		case .let: return "let"
		}
	}
}
