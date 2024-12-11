//
//  GenericTests.swift
//  UIKitWorkspaceTests
//
//  Created by Siran Li on 6/27/24.
//

import Foundation
import XCTest
@testable import UIKitTable

final class GenericTests: XCTestCase {

    var generic: Generic<Any>!
    
    override func setUpWithError() throws {
        super.setUp()
        generic = Generic<Any>()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testAddItem() throws {
        generic.addItem(item: 1)
        generic.addItem(item: "John")
        generic.addItem(item: false)
        generic.printItems()
        XCTAssertNotNil(generic.getItems())
    }
}
