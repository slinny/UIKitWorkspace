import XCTest
@testable import UIKitTable

final class UIKitWorkspaceTests: XCTestCase {

    var calculator: Calculator?
    
    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let total = calculator?.sum(1, 2)
        XCTAssertEqual(3, total)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
