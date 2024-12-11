import XCTest
@testable import UIKitTable

final class CalculatorTests: XCTestCase {

    var calculator: Calculator!
    
    override func setUpWithError() throws {
        super.setUp()
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
        super.tearDown()
    }

    func testAdd() throws {
        let total = calculator.add(num1: 10.1, num2: 5)
        XCTAssertEqual(total, 15.1)
    }
}
