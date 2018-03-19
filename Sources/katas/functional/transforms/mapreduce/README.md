## Task

Your task is to implement a function that receives a list of `Movie` and returns the url of the largest box art.

If you want to use the provided tests the function must be called `getUrlOfLargestBoxArt`.

## Input

Use the `moviesDemo` field inside [DataSource.swift](https://github.com/FunctionalSwift/katas/Sources/katas/functional/transforms/DataSource.swift) file.

## Example

```swift
getUrlOfLargestBoxArt(list: moviesDemo) // a_place_in_the_cloud/Fracture300.jpg
```

## Conditions

* Do not use any loops.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
extension Array where Element == BoxArt {
	func biggestBoxArt() -> BoxArt {
		let (head, tail) = (self[0], self[1...])

		return tail.reduce(head) { acc, boxArt in
			if acc.area > boxArt.area {
				return acc
			}
			else {
				return boxArt
			}
		}
	}
}

func getUrlOfLargestBoxArt(list: [Movie]) -> String {
	return list.flatMap { $0.boxArts }
		.biggestBoxArt()
		.url
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.