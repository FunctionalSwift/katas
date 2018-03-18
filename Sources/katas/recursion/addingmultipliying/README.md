# Summary

**Question:** Can the number `59` be get from the number `1`, by adding `5` or multiplying by `7`?

**Answer:** `59 = 1 x 7 x 7 + 5 + 5`

# Task

Your task is to implement the pure function:

`canReach(number, add, multiply) -> Boolean`

It must return a boolean value, indicating if it's possible to reach the number `1`, by either adding `add` or multiplying by `multiply`.

You must implement this function using recursion.

If you want to use the provided tests the function must have the following signature `func canReach(n: Int, add: Int, multiply: Int) -> Bool`.

## Arguments

* number: the number to reach from `1`.
* add: the number that can be added in order to reach `number`.
* multiply: the number by which you can multiply in order to reach `number`.

## Example

```swift
canReach(n: 59, add: 5, multiply:  7) // true
canReach(n: 10, add: 5, multiply: 3) // false
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func canReach(n: Int, add: Int, multiply: Int) -> Bool {
	if (n <= 1) {
		return n == 1
	}
	else {
		if (n % multiply == 0 && multiply > 1) {
			return canReach(n: n / multiply, add: add, multiply: multiply) ||
				canReach(n: n - add, add: add, multiply: multiply)
		}
		else {
			return canReach(n: n - add, add: add, multiply: multiply)
		}
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.