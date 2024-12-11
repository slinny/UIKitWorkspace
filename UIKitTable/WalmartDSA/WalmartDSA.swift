//
//  WalmartDSA.swift
//  UIKitTable
//
//  Created by Siran Li on 6/26/24.
//

import Foundation

class WalmartDSA {
    
    // MARK: Given an array of integers, return an array with its contents being the sum of all integers up the index of every element. e.g., [1,2,3,4,5] -> [1,3,6,10,15]
    func previousSum(input: [Int]) -> [Int] {
        guard !input.isEmpty else {
            return []
        }
        
        var result: [Int] = input
        
        for i in 1..<input.count {
            result[i] = input[i] + result[i-1]
        }
        
        return result
    }
    
    // MARK: Function takes in an array of integers and a target number. Now shuffle the array moving the target number to the rightmost side. target must be the last element and the other numbers must be shuffled into random order
    func shuffleAndTarget(nums: inout [Int], target: Int) {
        var copy = nums
        for i in 0..<nums.count {
            if copy[i] == target {
                copy.remove(at: i)
                break
            }
        }
        
        var range = nums.count - 1
        for i in 0..<nums.count - 1 {
            let index = Int.random(in: 0..<range)
            nums[i] = copy[index]
            copy.remove(at: index)
            range -= 1
        }
        nums[nums.count - 1] = target
    }
}
