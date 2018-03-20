## Task

Your task is to implement a function that receives a list of `Movie` and returns a `Map` where the keys are the movie ids and the values are the movie titles.

If you want to use the provided tests the function must be called `get(movies: [Movie])`.

## Input

Use the `moviesDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
get(movies: moviesDemo)

/*
{
    70111470=Die Hard, 
    654356453=Bad Boys, 
    65432445=The Chamber, 
    675465=Fracture
}
*/
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
func get(movies: [Movie]) -> [Int : String] {
	return Dictionary(uniqueKeysWithValues:
		moviesDemo.map { ($0.id, $0.title) })
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.