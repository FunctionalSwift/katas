# Task

Your task is to implement a partially applied version of the following struct constructor:

```swift
struct Element {
	let type: String
	let position: String
	let id: Int
}
```

We want a partially applied function for elements of type "Blog" and position "Fixed", that allows us to create elements based on the element's id.

If you want to use the provided tests the function must be a variable called `partial`.

# Conditions

- You can't alter the `Element` struct nor directly nor via extensions.
- You can't create a new function (with `func`) to achieve the purpose of the kata.

## Solution

<details><summary><strong>Reveal</strong></summary><p>

---
```swift
var partial: (Int) -> Element = { id in
	return Element(type: "Blog", position: "Fixed", id: id)
}
```

</p></details>

---

Copyright © [FunctionalHub.com](http://functionalhub.com) 2018. All rights reserved.