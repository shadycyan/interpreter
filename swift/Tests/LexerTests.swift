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
		"""

		let tests: [Token] = [
			.let,
			.ident("five"),
			.equal,
			.int("5"),
			.semi,
			.let,
			.ident("ten"),
			.equal,
			.int("10"),
			.semi,
			.let,
			.ident("add"),
			.equal,
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
			.let,
			.ident("result"),
			.equal,
			.ident("add"),
			.lParen,
			.ident("five"),
			.comma,
			.ident("ten"),
			.rParen,
			.semi,
			.eof,
		]

		var lexer = Lexer(input: input)

		for (i, expectedToken) in tests.enumerated() {
			guard let token = try? lexer.nextToken() else {
				XCTFail("Failed to get next token")
				return
			}

			XCTAssertEqual(
				expectedToken,
				token,
				"tests[\(i)] - Expected: \(expectedToken), Actual: \(token)"
			)
		}
	}
}
