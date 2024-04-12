@testable import Lexer
import Token
import XCTest

final class LexerTests: XCTestCase {
	func testNextToken() {
		let input = "=+(){},;"

		let tokens: [Token] = [
			.equal,
			.plus,
			.lParen,
			.rParen,
			.lSquirly,
			.rSquirly,
			.comma,
			.semi,
		]

		var lexer = Lexer(input: input)

		for (i, expectedToken) in tokens.enumerated() {
			guard let token = try? lexer.getNextToken() else {
				XCTFail("Failed to get next token")
				return
			}

			XCTAssertEqual(
				expectedToken,
				token,
				"Token at index \(i) does not match. Expected: \(expectedToken), Actual: \(token)"
			)
		}
	}
}
