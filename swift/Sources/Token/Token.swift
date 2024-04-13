//
//  Token.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

import Foundation

public enum Token: Equatable {
	case equal
	case plus
	case minus
	case bang
	case forwardSlash
	case asterisk
	case lessThan
	case greaterThan
	case semi
	case comma
	case lParen
	case rParen
	case lSquirly
	case rSquirly
	case eof
	case ident(String)
	case `let`
	case function
	case int(String)
	case illegal(String)

	public var literal: String {
		switch self {
		case let .illegal(literal): return literal
		case .eof: return ""
		case let .ident(literal): return literal
		case let .int(literal): return literal
		case .equal: return "="
		case .plus: return "+"
		case .minus: return "-"
		case .bang: return "!"
		case .asterisk: return "*"
		case .forwardSlash: return "/"
		case .lessThan: return "<"
		case .greaterThan: return ">"
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

	static var keywords: [Token] = [
		.let,
		.function,
	]

	public static func lookupKeywords(identifier: String) -> Token {
		if let token = keywords.first(where: { $0.literal == identifier }) {
			return token
		} else {
			return .ident(identifier)
		}
	}
}
