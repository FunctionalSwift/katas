// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class FlatMapSimpleKataTests: XCTestCase {
	func testGetAllMoviesIdsShoulReturnValidList() {
		let moviesIds = [70111470, 654356453, 65432445, 675465]

		let moviesIdsFlatMap = getAllMoviesIds(list: movieListDemo)

		XCTAssertEqual(moviesIds, moviesIdsFlatMap)
	}
}

