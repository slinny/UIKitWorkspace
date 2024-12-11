//
//  WalmartDSATests.swift
//  UIKitWorkspaceTests
//
//  Created by Siran Li on 6/26/24.
//

import Foundation
@testable import UIKitTable
import XCTest

class WalmartDSATests: XCTestCase {
    
    private var dsa: WalmartDSA!
    
    override func setUpWithError() throws {
        super.setUp()
        dsa = WalmartDSA()
    }
    
    override func tearDownWithError() throws {
        dsa = nil
        super.tearDown()
    }
    
    func testPreviousSumSuccess() throws {
        let nums = [1,2,3,4,5]
        let results = dsa.previousSum(input: nums)
        XCTAssertEqual(results, [1,3,6,10,15])
    }
    
    func testPreviousSumFail() throws {
        let nums = [1,2,3,4,5]
        let results = dsa.previousSum(input: nums)
        XCTAssertNotEqual(results, [1,3,5,10,15])
    }
    
    func testShuffleAndTargetSuccess() throws {
        var nums = [1,2,3,4,5]
        dsa.shuffleAndTarget(nums: &nums, target: 2)
        XCTAssertEqual(nums.last, 2)
    }
    
    func testShuffleAndTargetFail() throws {
        var nums = [1,2,3,4,5]
        dsa.shuffleAndTarget(nums: &nums, target: 2)
        XCTAssertNotEqual(nums.last, 3)
    }
}
