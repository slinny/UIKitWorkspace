import XCTest
@testable import UIKitTable

final class RegisterViewControllerTests: XCTestCase {
    
    var registerViewController: RegisterViewController?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        registerViewController = RegisterViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        registerViewController = nil
    }
    
    func testUsernameValidation_ContainsNumbers_InvalidCase() throws {
        let result = registerViewController?.validateUsername("abc123")
        XCTAssertFalse(result ?? true)
    }
    
    func testUsernameValidation_UsernameNil_InvalidCase() throws {
        let result = registerViewController?.validateUsername(nil)
        XCTAssertFalse(result ?? true)
    }
    
    func testUsernameValidation_ContainsSpecialCharacters_InvalidCase() throws {
        let result = registerViewController?.validateUsername("abc.,.")
        XCTAssertFalse(result ?? true)
    }
    
    func testUsernameValidation_MoreThanEightCharacters_InvalidCase() throws {
        let result = registerViewController?.validateUsername("asdbnqwequ")
        XCTAssertFalse(result ?? true)
    }
    
    func testUsernameValidation_validCase() throws {
        let result = registerViewController?.validateUsername("newuser")
        XCTAssertTrue(result ?? false)
    }
    
    func testPasswordValidation_PasswordNil_InvalidCase() throws {
        let result = registerViewController?.validatePassword(nil)
        XCTAssertFalse(result ?? true)
    }
    
    func testPasswordValidation_LessThanEightCharacters_InvalidCase() throws {
        let result = registerViewController?.validatePassword("eqweiq")
        XCTAssertFalse(result ?? true)
    }
    
    func testPasswordValidation_MoreThanTwelveCharacters_InvalidCase() throws {
        let result = registerViewController?.validatePassword("eqweiq2312031")
        XCTAssertFalse(result ?? true)
    }
    
    func testPasswordValidation_ValidCase() throws {
        let result = registerViewController?.validatePassword("eqweiq123")
        XCTAssertTrue(result ?? false)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
