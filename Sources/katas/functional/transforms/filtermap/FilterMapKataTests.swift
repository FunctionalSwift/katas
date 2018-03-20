// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class FilterMapKataTests: XCTestCase {
	func testGetFiveRatingMoviesIdsShoulReturnValidList() {
		let ratings = [654356453, 675465]

		let moviesRatings = getFiveRatingMoviesIds(movies: moviesDemo)

		XCTAssertEqual(ratings, moviesRatings)
	}

	static var allTests = [
		("testGetFiveRatingMoviesIdsShoulReturnValidList", testGetFiveRatingMoviesIdsShoulReturnValidList)
	]
}

