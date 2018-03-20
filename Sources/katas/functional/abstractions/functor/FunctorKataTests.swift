// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class FunctorKataTests: XCTestCase {

	// Note: this ugly casts are there to make the test compile
	// without the correct method signatures.
	// Once the kata is finished, you can remove them
	
	func testGetShouldReturnValueWhenSuccess() {
		let aTry = Try { "Test" }

		XCTAssertEqual("Test", try! aTry.get() as! String)
	}

	func testGetShouldThrowErrorWhenFailure() {
		let aTry = Try { throw TryError.predicateError("a") }

		shouldThrow(error: TryError.predicateError("a")) {
			_ = try aTry.get()
		}
	}

	func testFilterOverSuccessShouldFilterValidValue() {
		let aTry = Try<Int> { 6 }
			.filter { $0 > 5} as! Try<Int>

		XCTAssertEqual(6, try! aTry.get() as! Int)
	}

	func testFilterOverSuccessShouldFailIfInvalidValue() {
		let aTry: Try<Int> = Try<Int> { 6 }
			.filter { $0 > 10 } as! Try<Int>

		shouldThrow(error: TryError.predicateError("Predicate does not hold for \(6)")) {
			_ = try aTry.get()
		}
	}

	func testIsSuccessShouldReturnFalseWhenFailure() {
		let aTry = Try { throw TryError.predicateError("a") }

		XCTAssertEqual(false, aTry.isSuccess())
	}

	func testIsSuccessShouldReturnTrueWhenSuccess() {
		let aTry = Try { "Test" }

		XCTAssertEqual(true, aTry.isSuccess())
	}

	func testIsFailureShouldReturnTrueWhenFailure() {
		let aTry = Try { throw TryError.predicateError("a") }

		XCTAssertEqual(true, aTry.isFailure())
	}

	func testIsFailureShouldReturnFalseWhenSuccess() {
		let aTry = Try { "Test" }

		XCTAssertEqual(false, aTry.isFailure())
	}

	func testMapShouldTransformTheValueIfSuccess() {
		let aTry = Try<String> { "Test" }
			.map { "Valid \($0)" } as! Try<String>

		XCTAssertEqual("Valid Test", try! aTry.get() as! String)
	}

	func testMapShouldReturnOriginalErrorIfFailure() {
		let aTry = Try<String> { throw TryError.predicateError("b") }
			.map { "Valid \($0)" } as! Try<String>

		shouldThrow(error: TryError.predicateError("b")) {
			_ =  try aTry.get()
		}
	}

	func testFoldOnSuccessShouldReturnResultFromSecondParameter() {
		let result = Try { "4" }
			.fold({ _ in 3 }, { Int($0)! })

		XCTAssertEqual(4, result as! Int)
	}

	func testFoldOnFailureShouldReturnResultFromFirstParameter() {
		let result = Try { throw TryError.predicateError("a") }
			.fold({ _ in 3 }, { Int($0)! })

		XCTAssertEqual(3, result as! Int)
	}

	static var allTests = [
		("testGetShouldReturnValueWhenSuccess", testGetShouldReturnValueWhenSuccess),
		("testGetShouldThrowErrorWhenFailure", testGetShouldThrowErrorWhenFailure),
		("testFilterOverSuccessShouldFilterValidValue", testFilterOverSuccessShouldFilterValidValue),
		("testFilterOverSuccessShouldFailIfInvalidValue", testFilterOverSuccessShouldFailIfInvalidValue),
		("testIsSuccessShouldReturnFalseWhenFailure", testIsSuccessShouldReturnFalseWhenFailure),
		("testIsSuccessShouldReturnTrueWhenSuccess", testIsSuccessShouldReturnTrueWhenSuccess),
		("testIsFailureShouldReturnFalseWhenSuccess", testIsFailureShouldReturnFalseWhenSuccess),
		("testIsFailureShouldReturnTrueWhenFailure", testIsFailureShouldReturnTrueWhenFailure),
		("testMapShouldTransformTheValueIfSuccess", testMapShouldTransformTheValueIfSuccess),
		("testMapShouldReturnOriginalErrorIfFailure", testMapShouldReturnOriginalErrorIfFailure),
		("testFoldOnSuccessShouldReturnResultFromSecondParameter", testFoldOnSuccessShouldReturnResultFromSecondParameter),
		("testFoldOnFailureShouldReturnResultFromFirstParameter", testFoldOnFailureShouldReturnResultFromFirstParameter)
	]
}

func shouldThrow<E: Error & Equatable>(error: E, fn: () throws -> ()) {
	do {
		_ = try fn()
		XCTFail("should throw error")
	} catch let err as E {
		XCTAssertEqual(err, error)
	} catch {
		XCTFail("should catch error \(error.self)")
	}
}

