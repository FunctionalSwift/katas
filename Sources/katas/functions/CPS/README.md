# Summary

In imperative programming is really typical to implement conditional paths using callbacks/delegates.
 
```swift
enum SomeError: Error {
	case error(message: String)
}

protocol Delegate {
	func onSucess(int: Int)
	func onFailure(error: SomeError)
}

func performOperation(boolean: Bool, delegate: Delegate) {
	if (boolean) {
		delegate.onSucess(int: 42)
	}
	else {
		delegate.onFailure(error: SomeError.error(message: "error"))
	}
}
```

# Task

Your task is to implement a function (similar to `performOperation`) but that uses CPS to manage both branches of the execution (success and failure) instead of a `Delegate`.

As a bonus, you should implement this function so that instead of receiving a `Boole` as the check of the computation, it should receive a function, that allows to lazily evaluate the check.

If you want to use the provided tests the function must be called `performOperationCPS`.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
enum AnyError: Error {
	case any
}

func perfomOperationCPS(check: () -> Bool,
	onSuccess: (Int) -> (), onError: (Error) -> ()) {

	if check() {
		onSuccess(42)
	}
	else {
		onError(AnyError.any)
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.