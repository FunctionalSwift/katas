// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class MonoidKataTests: XCTestCase {

	// Note: this ugly casts are there to make the test compile
	// without the correct method signatures.
	// Once the kata is finished, you can remove them
	
	func testPlusShoulReturnFailureIfFirstTryIsFailure() {
		let aTry = Try<String> { throw TryError.predicateError("") }
			.plus(aTry: Try<String> { "Hi!" }) { (a1: String, a2: String) in
				a1 + a2
			} as! Try<String>

		shouldThrow(error: TryError.predicateError("")) {
			_ = try aTry.get()
		}
	}

	func testPlusShouldReturnFailureIfSecondTryIsFailure() {
		let aTry = Try<String> { "Hello!" }
			.plus(aTry: Try<String> { throw TryError.predicateError("") }) { (a1: String, a2: String) in
				a1 + a2
			} as! Try<String>

		shouldThrow(error: TryError.predicateError("")) {
			_ = try aTry.get()
		}
	}

	func testShouldConcatIfBothAreSuccess() {
		let aTry = Try<String> { "Hello!" }
			.plus(aTry: Try<String> { " Hi!" }) { (a1: String, a2: String) in
				a1 + a2
			} as! Try<String>

		XCTAssertEqual("Hello! Hi!", try! aTry.get() as! String)
	}
}

