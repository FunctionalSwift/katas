// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

struct Class {
	let a: String
	let b: Int
}

func curry<A, B, C>(_ fn: @escaping (A, B) -> C) -> (A) -> (B) -> C {
	return { a in { b in fn(a, b) } }
}

class ApplicativeKataTests: XCTestCase {
	
	// Note: this ugly casts are there to make the test compile
	// without the correct method signatures.
	// Once the kata is finished, you can remove them

	func testApplyParameterShouldWorkIfAllParametersAreCorrect() {
		let value = curry(Class.init)
			<%> Try<String> { "hello" }
			<*> Try { 3 } as! Try<Class>


		let classValue: Class = try! value.get() as! Class

		XCTAssertEqual("hello", classValue.a)
		XCTAssertEqual(3, classValue.b)
	}

	func testApplyParameterShouldFailIfAnyParameterIsIncorrect() {
		let value = curry(Class.init)
			<%> Try<String> { throw TryError.predicateError("") }
			<*> Try { 3 } as! Try<Class>

		shouldThrow(error: TryError.predicateError("")) {
			_ = try value.get()
		}
	}
}

