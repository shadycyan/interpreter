@testable import Lexer
import Token
import XCTest

final class LexerTests: XCTestCase {
	func testNextToken() {
		let input = """
		let five = 5;
		let ten = 10;

		let add = fn(x, y) {
			x + y;
		};

		let result = add(five, ten);
		!-/*5;
		5 < 10 > 5;

		if (5 < 10) {
			return true;
		} else {
			return false;
		}

		10 == 10;
		10 != 9;
		"""

		let tests: [Token] = [
			.let,
			.ident("five"),
			.assign,
			.int("5"),
			.semi,
			.let,
			.ident("ten"),
			.assign,
			.int("10"),
			.semi,
			.let,
			.ident("add"),
			.assign,
			.function,
			.lParen,
			.ident("x"),
			.comma,
			.ident("y"),
			.rParen,
			.lSquirly,
			.ident("x"),
			.plus,
			.ident("y"),
			.semi,
			.rSquirly,
			.semi,
			.let,
			.ident("result"),
			.assign,
			.ident("add"),
			.lParen,
			.ident("five"),
			.comma,
			.ident("ten"),
			.rParen,
			.semi,
			.bang,
			.minus,
			.forwardSlash,
			.asterisk,
			.int("5"),
			.semi,
			.int("5"),
			.lessThan,
			.int("10"),
			.greaterThan,
			.int("5"),
			.semi,
			.if,
			.lParen,
			.int("5"),
			.lessThan,
			.int("10"),
			.rParen,
			.lSquirly,
			.return,
			.true,
			.semi,
			.rSquirly,
			.else,
			.lSquirly,
			.return,
			.false,
			.semi,
			.rSquirly,
			.int("10"),
			.equal,
			.int("10"),
			.semi,
			.int("10"),
			.notEqual,
			.int("9"),
			.semi,
			.eof,
		]

		var lexer = Lexer(input: input)

		for (i, expectedToken) in tests.enumerated() {
			let token = lexer.nextToken()

			XCTAssertEqual(
				expectedToken,
				token,
				"tests[\(i)] - Expected: \(expectedToken), Actual: \(token)"
			)
		}
	}
}
