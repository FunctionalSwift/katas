# Task

Implement `Array.reduce` using recursion. Unlike array's standard reduce this function should not receive an accumulator, it should use the first element of the list as the initial value.

If the list is empty it should throw a `listCannotBeEmpty` error.

If you want to use the provided tests the function must be in a Array extension and have to be the following signature `func reduce(_ operation: (Element, Element) -> Element) throws -> Element`.

## Arguments

* operation: Function to use as the reduction step. It should be a function with the following type: `(Element, Element) -> Element` where `Element` is the type of the elements of the collection.

## Example

```swift
let list = ["functional", "hub", ".", "com"]

try list.reduce(+) // "functionalhub.com" 
```

## Conditions

* Do not use any loops.
* Do not use any `Array` methods like `reduce` (but you can create them).

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
enum ReduceError: Error {
	case listCannotBeEmpty
}

extension Array {
	func reduceWithAcc<A>(acc: A, operation: (A, Element) -> A) -> A {
		guard !isEmpty else {
			return acc
		}

		let (head, tail) = (self[0], Array(self[1...]))

		return tail.reduceWithAcc(acc: operation(acc, head), operation: operation)
	}

	func reduce(_ operation: (Element, Element) -> Element) throws -> Element {
		guard !isEmpty else {
			throw ReduceError.listCannotBeEmpty
		}

		let (head, tail) = (self[0], Array(self[1...]))

		return tail.reduceWithAcc(acc: head, operation: operation)
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.