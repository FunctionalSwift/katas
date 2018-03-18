// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class CurryingKataTests: XCTestCase {
	func testCurryFunctionShouldCurryPlusFunction() {
		let addCurried = curry(plus)

		XCTAssertEqual(4, addCurried(1)(3))
	}

	func testCurryFunctionShouldCurryConcatFunction() {
		let concatCurried = curry(concat)

		XCTAssertEqual("hello", concatCurried("he")("llo"))
	}
}
