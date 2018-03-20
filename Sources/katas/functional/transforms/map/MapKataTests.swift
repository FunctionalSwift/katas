// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class MapKataTests: XCTestCase {
	func testShouldReturnValidMap() {
		let dict: [Int : String] = [
			70111470 : "Die Hard",
			654356453 : "Bad Boys",
			65432445 : "The Chamber",
			675465 : "Fracture"
		]

		let moviesDict = get(movies: moviesDemo)

		XCTAssertEqual(dict, moviesDict)
	}

	static var allTests = [
		("testShouldReturnValidMap", testShouldReturnValidMap)
	]
}

