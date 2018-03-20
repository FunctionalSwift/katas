// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class ReduceKataTests: XCTestCase {
	func testReduceWithPlusShouldJoinAllStrings() throws {
		let list = ["functional", "hub", ".", "com"]

		let reduced = try list.reduce(+)

		XCTAssertEqual("functionalhub.com", reduced)
	}

	func testReduceShouldCalculateFactorial() throws {
		let factorial = try Array(1...10).reduce(*)

		XCTAssertEqual(3628800, factorial)
	}

	func testReduceShouldThrowIfListIsEmpty() throws {
		let emptyList = [Int]()

		do {
			_ = try emptyList.reduce(+)
		}
		catch {
			XCTAssert(error is ReduceError)
			XCTAssertEqual(error as! ReduceError, ReduceError.listCannotBeEmpty)
		}
	}

	static var allTests = [
		("testReduceWithPlusShouldJoinAllStrings", testReduceWithPlusShouldJoinAllStrings),
		("testReduceShouldCalculateFactorial", testReduceShouldCalculateFactorial),
		("testReduceShouldThrowIfListIsEmpty", testReduceShouldThrowIfListIsEmpty)
	]
}
