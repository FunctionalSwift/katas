# Task

Your task is to a function that receive two elements of the same type and return an element of that same type.

`(A, A) -> A`

This extension functions must return a currified version of the function passed.

If you want to use the provided tests the function must have the following signature: `func curry<A>(_ fn: @escaping (A, A) -> A) -> (A) -> (A) -> A`.

## Example

```swift
func add(x: Int, y: Int) -> Int{
	return x + y
}

let addCurried = curry(add) // (Int) -> (Int) -> Int

addCurried(1) // (Int) -> Int
addCurried(1, 2) // 3
```

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func curry<A>(_ fn: @escaping (A, A) -> A) -> (A) -> (A) -> A {
	return { a in { b in fn(a, b) } }
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.