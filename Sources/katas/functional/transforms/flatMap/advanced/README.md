## Task

Your task is to implement a function that receives a list of `MovieList` (a list of lists of `Movie`) and returns an `Array` containing a map with the following keys:

- For key `id` the movie's id.
- For key `title` the movie's title.

If you want to use the provided tests the function must be called `getAllMoviesInformation`.

## Input

Use the `movieListsDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getAllMoviesInformation(list: movieListDemo)

/*
[
    {
        id=70111470, 
        title=Die Hard
    },
    {
        id=654356453, 
        title=Bad Boys
     },
    {
        id=65432445, 
        title=The Chamber
    },
    {
        id=675465, 
        title=Fracture
    }
]
 */
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func getAllMoviesInformation(list: [MovieList]) -> [[String : String]] {
	return list.flatMap { $0.movies }.map {
		return Dictionary(uniqueKeysWithValues: [
			("id", "\($0.id)"),
			("title", $0.title),
		])
	}
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.