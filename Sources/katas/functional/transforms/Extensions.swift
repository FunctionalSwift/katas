// Copyright © FunctionalHub.com 2018. All rights reserved.

func compareMoviesDict(dict1: [[String : String]], dict2: [[String: String]]) -> Bool {
	guard dict1.count == dict2.count else { return false }
	let sortedDict1 = dict1.sorted(by: { $0["id"]! < $1["id"]! })
	let sortedDict2 = dict2.sorted(by: { $0["id"]! < $1["id"]! })

	for (index, element) in sortedDict1.enumerated() {
		guard sortedDict2[index] == element else { return false }
	}

	return true
}
