## Task

Your task is to implement a function that receives a list of `Movie` and a list of `Cast` and returns a map whose keys are the movie titles and the values are the movie first actor's name (not full name).

In order to use the `zip` function developers can assume the two lists contain information about the same movies, in the same order.

If you want to use the provided tests the function must be called `getFirstActorMap`.

## Input

Use the `moviesDemo` and `castsDemo` fields inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getFirstActorMap(movies: moviesDemo, casts: castsDemo)
/*
    {
        Die Hard=Bruce, 
        Bad Boys=Will, 
        The Chamber=Gene, 
        Fracture=Ryan
    }
 */
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
extension Cast {
	func firstActorName() -> String {
		return String(people.first?.name.split(separator: " ").first ?? "")
	}
}

func getFirstActorMap(movies: [Movie], casts: [Cast]) -> [String : String] {
	return Dictionary(uniqueKeysWithValues: zip(movies, casts).map {
		return ($0.0.title, $0.1.firstActorName())
	})
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.