// Copyright © FunctionalHub.com 2018. All rights reserved.


enum ReduceError: Error {
	case listCannotBeEmpty
}

extension Array {
	func reduce(_ operation: (Element, Element) -> Element) throws -> Element {
		throw ReduceError.listCannotBeEmpty
	}
}
