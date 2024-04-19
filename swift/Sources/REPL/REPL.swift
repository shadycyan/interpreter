//
//  REPL.swift
//
//
//  Created by Cyan on 4/19/24.
//

import Lexer
import Token

public enum REPL {
	public static func start() {
		let prompt = ">> ", greenColor = "\u{001B}[0;32m"
		print(greenColor + prompt, terminator: "")
		guard let lines = readLine() else { return }

		for line in lines.split(separator: "\n") {
			var tokenizer = Lexer(input: String(line))

			var token: Token
			repeat {
				token = tokenizer.nextToken()
				print(token)
			} while token != .eof
		}

		start()
	}
}
