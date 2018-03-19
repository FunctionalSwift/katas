// Copyright © FunctionalHub.com 2018. All rights reserved.

extension Try {
	func apply(_ tryAB: Any) -> Any {
		return ""
	}
}

infix operator <%>: AdditionPrecedence
infix operator <*>: AdditionPrecedence


func <%>(_ transform: Any, resultA: Any) -> Any {
	return ""
}

func <*>(_ curriedResult: Any, resultA: Any) -> Any {
	return ""
}
