//
//  Token.swift
//  Monkey
//
//  Created by Cyan on 4/11/24.
//

public enum Token: Equatable {
	case illegal(String)
	case eof
	// Identifiers
	case ident(String)
	case int(String)
	// Operators
	case assign
	case plus
	case minus
	case bang
	case forwardSlash
	case asterisk
	case lessThan
	case greaterThan
	case equal
	case notEqual
	// Delimiters
	case semi
	case comma
	case lParen
	case rParen
	case lSquirly
	case rSquirly
	// Keywords
	case function
	case `let`
	case `true`
	case `false`
	case `if`
	case `else`
	case `return`

	public var literal: String {
		switch self {
		case .eof: return ""
		case let .illegal(literal): return literal
		case let .ident(literal): return literal
		case let .int(literal): return literal
		case .assign: return "="
		case .plus: return "+"
		case .minus: return "-"
		case .bang: return "!"
		case .forwardSlash: return "/"
		case .asterisk: return "*"
		case .lessThan: return "<"
		case .greaterThan: return ">"
		case .equal: return "=="
		case .notEqual: return "!="
		case .comma: return ","
		case .semi: return ";"
		case .lParen: return "("
		case .rParen: return ")"
		case .lSquirly: return "{"
		case .rSquirly: return "}"
		case .function: return "fn"
		case .let: return "let"
		case .true: return "true"
		case .false: return "false"
		case .if: return "if"
		case .else: return "else"
		case .return: return "return"
		}
	}

	public static var keywords: [String: Token] = [
		Token.function.literal: .function,
		Token.let.literal: .let,
		Token.true.literal: .true,
		Token.false.literal: .false,
		Token.if.literal: .if,
		Token.else.literal: .else,
		Token.return.literal: .return,
	]
}
