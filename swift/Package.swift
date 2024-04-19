// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Monkey",
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.executableTarget(
			name: "Monkey",
			dependencies: ["REPL"],
			path: "Sources/Monkey"
		),
		.target(
			name: "Token",
			dependencies: [],
			path: "Sources/Token"
		),
		.target(
			name: "Lexer",
			dependencies: ["Token"],
			path: "Sources/Lexer"
		),
		.target(
			name: "REPL",
			dependencies: ["Lexer", "Token"],
			path: "Sources/REPL"
		),
		.testTarget(
			name: "LexerTest",
			dependencies: ["Lexer", "Token"],
			path: "Tests"
		),
	]
)
