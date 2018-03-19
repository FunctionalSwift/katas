// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class MapReduceKataTests: XCTestCase {
	func testGetUrlOfLargestBoxArtIstheLargest() {
		let largestUrl = "a_place_in_the_cloud/Fracture300.jpg"

		XCTAssertEqual(largestUrl, getUrlOfLargestBoxArt(list: moviesDemo))
	}
}

