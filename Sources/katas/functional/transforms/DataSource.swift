// Copyright © FunctionalHub.com 2018. All rights reserved.

let moviesDemo: [Movie] = [
	Movie(id: 70111470, title: "Die Hard", rating: 4.0, interestingMoments: [
			InterestingMoment(type: "End", time: 213432),
			InterestingMoment(type: "Middle", time: 64534),
			InterestingMoment(type: "Start", time: 323133)
		]
	),
	Movie(id: 654356453, title: "Bad Boys", rating: 5.0, interestingMoments: [
			InterestingMoment(type: "End", time: 54654754),
			InterestingMoment(type: "Middle", time: 43524243),
			InterestingMoment(type: "Start", time: 6575665)
		]
	),
	Movie(id: 65432445, title: "The Chamber", rating: 4.0, interestingMoments: [
			InterestingMoment(type: "End", time: 132423),
			InterestingMoment(type: "Middle", time: 54637425),
			InterestingMoment(type: "Start", time: 3452343)
		]
	),
	Movie(id: 675465, title: "Fracture", rating: 5.0, interestingMoments: [
			InterestingMoment(type: "End", time: 45632456),
			InterestingMoment(type: "Middle", time: 234534),
			InterestingMoment(type: "Start", time: 3453434)
		],
		boxArtsWidths: [150, 200, 300]
	),
]

let movieListDemo: [MovieList] = [
	MovieList(name: "New Releases", movies: Array(moviesDemo.dropLast(2))),
	MovieList(name: "Dramas", movies: Array(moviesDemo.dropFirst(2)))
]

let castsDemo: [Cast] = [
	Cast(id: 70111470, people: [
			Person(name: "Bruce Willis", role: "John McClane"),
			Person(name: "Alan Rickman", role: "Hans Gruber")
		]
	),
	Cast(id: 654356453, people: [
			Person(name: "Will Smith", role: "Mike Lowrey"),
			Person(name: "Martin Lawrence", role: "Marcus Burnett")
		]
	),
	Cast(id: 65432445, people: [
			Person(name: "Gene Hackman", role: "Sam Cayhall"),
			Person(name: "Chris O'Donnell", role: "Adam Hall")
		]
	),
	Cast(id: 675465, people: [
			Person(name: "Ryan Gosling", role: "Willy Beachum"),
			Person(name: "Anthony Hopkins", role: "Ted Crawford")
		]
	)
]
