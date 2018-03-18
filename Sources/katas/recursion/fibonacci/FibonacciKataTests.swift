// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class FibonacciKataTests: XCTestCase {
	func testFibonnacciShouldReturnNumbersInPosition() {
		let fibonacciList = [
			1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987
		]

		for (index, element) in fibonacciList.enumerated() {
			XCTAssertEqual(element, fibonacci(index: index))
		}
	}
}
