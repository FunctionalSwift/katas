## Task

Your task is to implement a function that receives a list of `Movie` and returns a `Array` containing the ids of the movies whose rating is `5.0`.

If you want to use the provided tests the function must be called `getFiveRatingMoviesIds`.

## Input

Use the `moviesDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getFiveRatingMoviesIds(movies: moviesDemo) // [654356453, 675465]
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func getFiveRatingMoviesIds(movies: [Movie]) -> [Int] {
	return movies.filter { $0.rating == 5.0 }.map { $0.id }
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.