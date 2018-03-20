// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class ZipKataTests: XCTestCase {
	func testGetFirstActorMapShouldReturnCorrectMap() {
		let filmsAnActors = [
			"Die Hard" : "Bruce",
			"Bad Boys" : "Will",
			"The Chamber" : "Gene",
			"Fracture" : "Ryan"
		]

		XCTAssertEqual(filmsAnActors, getFirstActorMap(movies: moviesDemo, casts: castsDemo))
	}

	static var allTests = [
		("testGetFirstActorMapShouldReturnCorrectMap", testGetFirstActorMapShouldReturnCorrectMap),
	]
}

