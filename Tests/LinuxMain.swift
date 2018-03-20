import XCTest
@testable import katasTests

XCTMain([
    testCase(ApplicativeKataTests.allTests),
    testCase(FunctorKataTests.allTests),
    testCase(MonadKataTests.allTests),
    testCase(MonoidKataTests.allTests),
    testCase(FilterMapKataTests.allTests),
    testCase(FlatMapAdvancedKataTests.allTests),
    testCase(FlatMapSimpleKataTests.allTests),
    testCase(MapKataTests.allTests),
    testCase(MapReduceKataTests.allTests),
    testCase(ReduceFunctionKataTests.allTests),
    testCase(ZipKataTests.allTests),
    testCase(CPSKataTests.allTests),
    testCase(CurryingKataTests.allTests),
    testCase(PartialKataTests.allTests),
    testCase(AddingMultipliyingKataTests.allTests),
    testCase(FibonacciKataTests.allTests),
    testCase(ReduceKataTests.allTests)
])
