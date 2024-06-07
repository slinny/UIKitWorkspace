import XCTest
@testable import UIKitTable

final class FizzBuzzTests: XCTestCase {
    
    var fizzBuzz: FizzBuzz?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fizzBuzz = FizzBuzz()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let case1 = fizzBuzz?.isMultipleOfThreeOrFive(number: 30)
        XCTAssertEqual(case1, "FizzBuzz")
        
        let case2 = fizzBuzz?.isMultipleOfThreeOrFive(number: 29)
        XCTAssertEqual(case2, "29")
        
        let case3 = fizzBuzz?.isMultipleOfThreeOrFive(number: 9)
        XCTAssertEqual(case3, "Fizz")
        
        let case4 = fizzBuzz?.isMultipleOfThreeOrFive(number: 20)
        XCTAssertEqual(case4, "Buzz")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
