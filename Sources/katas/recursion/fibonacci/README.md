<div style="text-align:center">
    <img alt="Fibonacci Spiral" src ="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Fibonacci_spiral.svg/2000px-Fibonacci_spiral.svg.png" />
</div>

# Summary

**Fibonacci** series is a series of natural numbers where the next number is the sum of the previous two numbers:
 
```
f(n) = f(n-1) + f(n-2)
```

The first two numbers in the **Fibonacci** series are always `1`, `1`.

[Read more about Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number)


# Task

Your task is to implement the pure function:

`fibonacci(index) -> Int`

It must return the the **Fibonacci** number inside the position `index`.

You must implement this function using tail-recursion.

If you want to use the provided tests the function must be called `fibonacci` and has the following signature `func fibonacci(index: Int) -> Int`.

## Arguments

* number: the **Fibonacci** number's position.

## Example

```swift
Array(0...11).forEach { print(fibonacci(index: $0)) } // 1 1 2 3 5 8 13 21 34 55 89 144
```

## Conditions

* Do not use any loops.
* You can use helper functions to achieve tail-recursion.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func fibonacci(index: Int) -> Int {
	func fibonacci(index: Int, a: Int, b: Int) -> Int {
		return index > 0 ? fibonacci(index: index - 1, a: b, b: a + b) : b
	}

	return fibonacci(index: index, a: 0, b: 1)
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.