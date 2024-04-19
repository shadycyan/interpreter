import Foundation
import REPL

@main
struct Monkey {
	static func main() throws {
		let userName = NSUserName(), purpleColor = "\u{001B}[0;35m"
		print(purpleColor + "Hello \(userName)! This is the Monkey programming language!")
		print(purpleColor + "Feel free to type in commands")

		REPL.start()
	}
}
