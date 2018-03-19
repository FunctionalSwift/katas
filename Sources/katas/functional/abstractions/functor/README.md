# Summary

In functional programming we can use lots of different types of error handling and reporting, which allows us to choose the best strategy for out situation.

- In one hand, we can use `Option` to model the absence of a value (like swift Optional)
- Or, for example, `Either` (same as course's `Result`) if we want to model our result as a type either successful or failure.
- On the other hand, we have `Try`, which represents an operation that can derive in a result (if it has been a success) or in an exception if something has failed.

Taking this into account we can the infer that there are only two possible implementation for `Try`, a `Success` `Try` and a `Failure` `Try`.

If we know that an operation could result in a failure, for example, because it is code from a library over which we have no control, or better yet, some method from the language itself. We can use Try as a substitute for the well-known try-catch, allowing us to rise to all its goodness.

# Task

Your task is to implement the `Try` type as a functor.

For that, you need to create it as a enum and implement two cases: `success` and `failure`.

Also you need to be able to create `Try` instances out of the result of a closure.

Then you will need to create the following methods for it:

- `filter`: It receives a predicate and returns a `Try` of the same type if the value contained matches the predicate.

- `fold`: Receives a function for handling both cases of the `Try`.

- `get`: Returns the value inside the `Try` or throws its error

- `isFailure`: Returns true if the `Try` is a `failure`. 

- `isSuccess`: Returns true if the `Try` is a `success`. 

And, of course, you must implement the `map` function that will add a functor instance to this type.

If you want to use the provided tests all this methods must be called as they are listed here.

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

Try { try "Test".toInt() }
	.filter { $0 > 5 }
	.map { $0 + 2 }
	.fold({
		error in "Error value"
	}, {
		value in "The value is \(value)"
	}) // Error value

Try { try "4".toInt() }
	.filter { $0 > 5 }
	.map { $0 + 2 } // TryError.predicateError("Predicate does not hold for 4")

Try { try "6".toInt() }
	.filter { $0 > 5 }
	.map { $0 + 2 }   
```

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
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
		do {
			self = .success(try f())
		} catch {
			self = .failure(error)
		}
	}
}

extension Try {
	func filter(_ predicate: (A) -> Bool) -> Try<A> {
		return fold({ .failure($0) }, { a in
			predicate(a) ? Try<A>.success(a) :
				Try.failure(TryError.predicateError("Predicate does not hold for \(a)"))
		})
	}

	func fold<B>(_ fe: (Error) -> (B), _ fa: (A) throws -> (B)) -> B {
		switch self {
		case .failure(let err):
			return fe(err)
		case .success(let a):
			do {
				return try fa(a)
			} catch {
				return fe(error)
			}
		}
	}

	func get() throws -> A {
		switch self {
		case .failure(let error):
			throw error
		case .success(let a):
			return a
		}
	}

	func isFailure() -> Bool {
		if case .failure = self {
			return true
		}

		return false
	}

	func isSuccess() -> Bool {
		if case .success = self {
			return true
		}

		return false
	}

	func map<B>(_ transform: (A) -> B) -> Try<B> {
		return fold({ .failure($0) }, { .success(transform($0)) })
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.