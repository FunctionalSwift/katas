## Task

Your task is to implement a function that receives a list of `Movie` and returns the largest rating.

If you want to use the provided tests the function must be called `getLargestRating`.

## Input

Use the `moviesDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getLargestRating(list: moviesDemo) // 5.0
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func getLargestRating(list: [Movie]) -> Double {
	return list.reduce(0.0) { acc, movie in
		if acc > movie.rating {
			return acc
		}
		else {
			return movie.rating
		}
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.