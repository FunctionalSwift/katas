// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class ReduceFunctionKataTests: XCTestCase {
	func testGetLargestRatingShouldReturnLargestRating() {
		XCTAssertEqual(5.0, getLargestRating(list: moviesDemo))
	}

	static var allTests = [
		("testGetLargestRatingShouldReturnLargestRating", testGetLargestRatingShouldReturnLargestRating)
	]
}

