// Copyright © FunctionalHub.com 2018. All rights reserved.

struct Element : Equatable {
	let type: String
	let position: String
	let id: Int

	static func ==(lhs: Element, rhs: Element) -> Bool {
		return lhs.type == rhs.type &&
			lhs.position == rhs.position &&
			lhs.id == rhs.id
	}
}

var partial: ((Int) -> Element)!
