# Task

Your task is to implement a monoid for the `Try` type.

For that, you should create the method `plus`.

If you want to use the provided tests this method must be called `plus`.

## Params

- `aTry`: a `Try` of the same type.
- `f`: a function that takes two `A` and return a `B`

## Example

```swift
enum IntError: Error {
	case mustBeInt
}

extension String {
	func toInt() throws -> Int {
		guard let number = Int(self) else {
			throw IntError.mustBeInt
		}
		
		return number
	}
}

Try { "hello" }.plus(Try { " hi" }) {
    a1, a2 in a1 + a2
} // success("hello hi")

Try { 3 }.plus(Try { " hi".toInt() }) {
    a1, a2 in a1 + a2
} // failure(IntError.mustBeInt)
```

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
extension Try {
	func plus<B>(aTry: Try<A>, f: (A, A) -> B) -> Try<B> {
		return fold(Try<B>.failure, { a in
			aTry.fold(Try<B>.failure, { aa in Try<B>.success(f(a, aa)) })
		})
	}
}

```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.