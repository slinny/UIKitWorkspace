//
//  OrderedSetTests.swift
//  UIKitWorkspaceTests
//
//  Created by Siran Li on 6/26/24.
//

import Foundation
@testable import UIKitTable
import XCTest

class OrderedSetTests: XCTestCase {
    
    private var orderedSet: OrderedSet<Int>!
    
    override func setUpWithError() throws {
        super.setUp()
        orderedSet = OrderedSet<Int>()
    }
    
    override func tearDownWithError() throws {
        orderedSet = nil
        super.tearDown()
    }

    func testExistTrue() throws {
        orderedSet.add(element: 5)
        XCTAssertTrue(orderedSet.exist(element: 5))
    }
    
    func testExistFalse() throws {
        XCTAssertFalse(orderedSet.exist(element: 10))
    }
    
    func testAddElementSuccess() throws {
        orderedSet.add(element: 3)
        XCTAssertEqual(orderedSet.getArray(), [3])
    }
    
    func testAddElementFail() throws {
        orderedSet.add(element: 3)
        XCTAssertNotEqual(orderedSet.getArray(), [])
    }
    
    func testRemoveElement() throws {
        orderedSet.add(element: 3)
        orderedSet.remove(element: 3)
        XCTAssertFalse(orderedSet.exist(element: 3))
    }
    
    func testRemoveNonExistentElement() throws {
        orderedSet.add(element: 3)
        orderedSet.remove(element: 5)
        XCTAssertEqual(orderedSet.getArray(), [3])
    }
    
    func testRemoveAtIndex() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        orderedSet.removeAtIndex(index: 1)
        XCTAssertEqual(orderedSet.getArray(), [1, 3])
    }
    
    func testRemoveAtIndexFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        orderedSet.removeAtIndex(index: 1)
        XCTAssertNotEqual(orderedSet.getArray(), [1, 2, 3])
    }
    
    func testRemoveAll() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        orderedSet.removeAll()
        XCTAssertEqual(orderedSet.getArray(), [])
    }
    
    func testRemoveAllFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        orderedSet.removeAll()
        XCTAssertNotEqual(orderedSet.getArray(), [3, 1, 2])
    }
    
    func testCount() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertEqual(orderedSet.count(), 3)
    }
    
    func testCountFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        XCTAssertNotEqual(orderedSet.count(), 3)
    }
    
    func testMax() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertEqual(orderedSet.max(), 3)
    }
    
    func testMaxFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertNotEqual(orderedSet.max(), 2)
    }
    
    func testMin() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertEqual(orderedSet.min(), 1)
    }
    
    func testMinFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertNotEqual(orderedSet.min(), 2)
    }
    
    func testAddArray() throws {
        orderedSet.addArray(array: [3, 1, 2])
        XCTAssertEqual(orderedSet.getArray(), [1, 2, 3])
    }
    
    func testAddArrayFail() throws {
        orderedSet.addArray(array: [3, 1, 2])
        XCTAssertNotEqual(orderedSet.getArray(), [])
    }
    
    func testGetIndex() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertEqual(orderedSet.getIndex(element: 2), 1)
    }
    
    func testGetIndexNonExistentElement() throws {
        orderedSet.add(element: 3)
        XCTAssertEqual(orderedSet.getIndex(element: 5), -1)
    }
    
    func testGetIndexFail() throws {
        orderedSet.add(element: 3)
        orderedSet.add(element: 1)
        orderedSet.add(element: 2)
        XCTAssertNotEqual(orderedSet.getIndex(element: 2), 0)
    }
}

