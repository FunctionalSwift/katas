// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class MonadKataTests: XCTestCase {

	// Note: this ugly casts are there to make the test compile
	// without the correct method signatures.
	// Once the kata is finished, you can remove them
	
	func testFlatMapShouldTransformIfSuccess() {
		let aTry = Try<String> { "Test" }.flatMap { (value: String) in
			Try { "A \(value)" }
		} as! Try<String>

		XCTAssertEqual("A Test", try! aTry.get() as! String)
	}

	func testFlatMapShouldFailIfFailure() {
		let aTry = Try<String> { "Test" }.flatMap { (value: String) in
			Try { throw TryError.predicateError("") }
		} as! Try<String>

		shouldThrow(error: TryError.predicateError("")) {
			_ = try aTry.get()
		}
	}
}

