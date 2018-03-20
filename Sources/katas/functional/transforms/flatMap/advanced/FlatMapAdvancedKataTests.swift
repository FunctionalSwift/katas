// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class FlatMapAdvancedKataTests: XCTestCase {
	func testGetAllMoviesInformationShouldReturnValidList() {
		let movies = moviesDemo.map { movie -> [String : String] in
			let tuples: [(String, String)] = [
				("id", "\(movie.id)"),
				("title", movie.title),
			]
			return Dictionary(uniqueKeysWithValues: tuples)
		}

		let moviesFlatMap = getAllMoviesInformation(list: movieListDemo)

		XCTAssertTrue(compareMoviesDict(dict1: movies, dict2: moviesFlatMap))
	}

	static var allTests = [
		("testGetAllMoviesInformationShouldReturnValidList", testGetAllMoviesInformationShouldReturnValidList)
	]
}

