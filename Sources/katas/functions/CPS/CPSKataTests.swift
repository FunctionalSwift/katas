// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class CPSKataTests: XCTestCase {
	func testPerformOperationCPSShouldCallOnSuccessIfTrue() {
		var result: Int?
		var error: Error?

		perfomOperationCPS(check: { true },
			onSuccess: { r in result = r },
			onError: { e in error = e })

		XCTAssertNil(error)
		XCTAssertEqual(42, result)
	}

	func testPerformOperationCPSShouldCallOnErrorIfFalse() {
		var result: Int?
		var error: Error?

		perfomOperationCPS(check: { false },
			onSuccess: { r in result = r },
			onError: { e in error = e })

		XCTAssertNil(result)
		XCTAssertNotNil(error)
	}
}
