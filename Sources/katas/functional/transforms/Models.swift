// Copyright © FunctionalHub.com 2018. All rights reserved.

struct Movie {
	let id: Int
	let title: String
	let rating: Double
	let interestingMoments: [InterestingMoment]
	let boxArtsWidths: [Int]

	init(id: Int, title: String, rating: Double,
		 interestingMoments: [InterestingMoment], boxArtsWidths: [Int] = [150, 200]) {
		self.id = id
		self.title = title
		self.rating = rating
		self.interestingMoments = interestingMoments
		self.boxArtsWidths = boxArtsWidths
	}

	var boxArts: [BoxArt] {
		return boxArtsWidths.map {
			BoxArt(width: $0, height: 200,
				name: title.split(separator: " ").joined())
		}
	}
}

struct BoxArt {
	let width: Int
	let height: Int
	let name: String

	init(width: Int, height: Int, name: String = "") {
		self.width = width
		self.height = height
		self.name = name
	}

	var url: String {
		return "a_place_in_the_cloud/\(name)\(width).jpg"
	}

	var area: Int {
		return width * height
	}
}

struct InterestingMoment {
	let type: String
	let time: Int
}

struct Cast {
	let id: Int
	let people: [Person]
}

struct Person {
	let name: String
	let role: String
}

struct MovieList {
	let name: String
	let movies: [Movie]
}
extension BoxArt: Equatable {
	static func ==(lhs: BoxArt, rhs: BoxArt) -> Bool {
		return lhs.height == rhs.height &&
			lhs.width == rhs.width &&
			lhs.name == rhs.name &&
			lhs.url == rhs.url
	}
}
