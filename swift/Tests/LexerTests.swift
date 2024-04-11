@testable import Lexer
import Token
import XCTest

final class LexerTests: XCTestCase {
	func testNextToken() {
		let input = "=+(){},;"

		let tokens: [Token] = [
			.assign,
			.plus,
			.lParen,
			.rParen,
			.lSquirly,
			.rSquirly,
			.comma,
			.semi,
		]

		let lexer = Lexer(input: input)

		for (i, testToken) in tokens.enumerated() {
			let token: Token = lexer.getNextToken()

			XCTAssertEqual(
				testToken,
				token,
				"tokens[\(i)] - \(testToken.literal != token.literal ? "literal" : "type") wrong. expected=\(testToken.literal), got=\(token.literal)"
			)
		}
	}
}
