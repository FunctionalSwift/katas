# Task

Your task is to implement a monad for the `Try` type.

For that, you should create the method `flatMap`.

If you want to use the provided tests this method must be called `flatMap`.

## Params

- `transform`: a function that takes an `A` and return a `Try<B>`

## Example

```swift
Try { "hi" }.flatMap {
    Try { "hello \($0)" }
} // success("hello hi")

Try { "hi" }.flatMap {
    throw TryError.predicateError("")
} // failure(TryError.predicateError(""))
```

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
extension Try {
	func flatMap<B>(_ transform: (A) throws -> Try<B>) -> Try<B> {
		return fold(Try<B>.failure, { try transform($0) })
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.