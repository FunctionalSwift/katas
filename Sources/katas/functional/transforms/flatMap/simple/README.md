## Task

Your task is to implement a function that receives a list of `MovieList` (a list of lists of `Movie`) and returns an `Array` containing the ids of the movies.

If you want to use the provided tests the function must be called `getAllMoviesIds`.

## Input

Use the `movieListsDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getAllMoviesIds(list: movieListsDemo) // [70111470, 654356453, 65432445, 675465]
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func getAllMoviesIds(list: [MovieList]) -> [Int] {
	return list.flatMap { $0.movies }.map { $0.id }
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.