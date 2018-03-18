// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class AddingMultipliyingKataTests: XCTestCase {
	func testCanReachShouldWorkForCertainCombinations() {

		XCTAssertTrue(canReach(n: 59, add: 5, multiply: 7))
		XCTAssertTrue(canReach(n: 1, add: 5, multiply: 5))
		XCTAssertFalse(canReach(n: 10, add: 5, multiply: 3))
		XCTAssertTrue(canReach(n: 100, add: 1, multiply: 1))
	}
}

