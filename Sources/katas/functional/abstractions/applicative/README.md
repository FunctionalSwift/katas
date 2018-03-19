# Task

Your task is to implement an applicative for the `Try` type.

For that, you should create the methods:

- `apply`: a function that receives a `Try<(A) -> B>` and returns a `Try<B>`.
- `<%>`: an infix operator that allows to `map` a function `(A) -> B` into a `Try<A>` to get a `Try<B>`.
- `<*>`: an infix operator that allow to apply a `Try<(A) -> B>` into a `Try<A>` to get a `Try<B>`.

If you want to use the provided tests these methods must be called as they are listed.

## Example

```swift
struct Class {
	let a: String
	let b: Int
}

let value = curry(Class.init)
	<%> Try<String> { "hello" }
	<*> Try { 3 } // success(Class("hello", 3))

let value = curry(Class.init)
	<%> Try<String> { throw TryError.predicateError("") }
	<*> Try { 3 } // failure(TryError.predicateError(""))
```

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
extension Try {
	func apply<B>(_ tryAB: Try<(A) -> B>) -> Try<B> {
		return flatMap { a in
			tryAB.map { ab in ab(a) }
		}
	}
}

infix operator <%>: AdditionPrecedence
infix operator <*>: AdditionPrecedence


func <%><A, B>(_ transform: @escaping (A) -> B, resultA: Try<A>) -> Try<B> {
	return resultA.map(transform)
}

func <*><A, B>(_ curriedResult: Try<(A) -> B>, resultA: Try<A>) -> Try<B> {
	return resultA.apply(curriedResult)
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.