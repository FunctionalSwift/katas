// Copyright © FunctionalHub.com 2018. All rights reserved.

import XCTest
@testable import katas

class PartialKataTests: XCTestCase {
	func testPartialMustReturnAPartiallyAppliedConstructor() {
		let element1 = partial(3)
		let element2 = partial(42)

		XCTAssertEqual(Element(type: "Blog", position: "Fixed", id: 3), element1)
		XCTAssertEqual(Element(type: "Blog", position: "Fixed", id: 42), element2)
	}

	static var allTests = [
		("testPartialMustReturnAPartiallyAppliedConstructor", testPartialMustReturnAPartiallyAppliedConstructor)
	]
}
