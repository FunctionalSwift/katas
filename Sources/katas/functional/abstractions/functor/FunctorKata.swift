// Copyright © FunctionalHub.com 2018. All rights reserved.

enum TryError: Error, Equatable {
	case predicateError(String)

	static func ==(lhs: TryError, rhs: TryError) -> Bool {
		guard case let predicateError(message1) = lhs,
			case let predicateError(message2) = rhs else {
				return false
		}

		return message1 == message2
	}
}

enum Try<A> {
	case success(A)
	case failure(Error)

	init(_ f: () throws -> A) {
		self = .success(try! f())
	}
}

extension Try {
	func filter(_ predicate: (A) -> Bool) -> Any {
		return ""
	}

	func fold<B>(_ fe: (Error) -> (B), _ fa: (A) throws -> (B)) -> Any {
		return ""
	}

	func get() throws -> Any {
		return ""
	}

	func isFailure() -> Bool {
		return false
	}

	func isSuccess() -> Bool {
		return false
	}

	func map<B>(_ transform: (A) -> B) -> Any {
		return ""
	}
}

