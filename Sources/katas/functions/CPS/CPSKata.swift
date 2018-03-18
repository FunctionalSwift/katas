// Copyright © FunctionalHub.com 2018. All rights reserved.

func curry<A>(_ fn: @escaping (A, A) -> A) -> (A) -> (A) -> A {
	return { a in { _ in a } }
}

func plus(a: Int, b: Int) -> Int {
	return a + b
}

func concat(a: String, b: String) -> String {
	return a + b
}
