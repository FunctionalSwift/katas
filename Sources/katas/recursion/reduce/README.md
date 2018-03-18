# Task

Implement `List.reduce` using recursion.

`reduce` behaves exactly likes `fold`, but instead of receiving an accumulator it uses the first element of the list as the initial value.

If you want to use the provided tests the function must be called `reduceKt` and must be inside the `recursion.reduce` package.

## Arguments

* operation: Function to use as the reduction step. Like the `List.reduce` `operation` parameter, it should be a function with the following type: `(A, A) -> A` where `A` is the type of the elements of the collection.

## Example

```swift
let list = ["functional", "hub", ".", "com"]

try list.reduce(+) // "functionalhub.com" 
```

## Conditions

* Do not use any loops.
* Do not use any `List` methods like `reduce` (but you can create it).

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