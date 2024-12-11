//
//  OrderedSet.swift
//  UIKitTable
//
//  Created by Siran Li on 6/26/24.
//

import Foundation

class OrderedSet<T: Comparable> {
    var setArray: [T] = []
    
    func exist(element: T) -> Bool {
        setArray.contains(element)
    }
    
    func add(element: T) {
        if !setArray.contains(element) {
            setArray.append(element)
        }
        setArray.sort()
    }
    
    func remove(element: T) {
        guard setArray.contains(element) else {
            return
        }
        var index = -1
        for i in 0..<setArray.count {
            if setArray[i] == element {
                index = i
                break
            }
        }
        if index >= 0 {
            setArray.remove(at: index)
        }
    }
    
    func removeAtIndex(index: Int) {
        setArray.remove(at: index)
    }
    
    func removeAll() {
        setArray = []
    }
    
    func count() -> Int {
        setArray.count
    }
    
    func max() -> T? {
        setArray.last
    }
    
    func min() -> T? {
        setArray.first
    }
    
    func addArray(array: [T]) {
        setArray += array
        setArray.sort()
    }
    
    func getIndex(element: T) -> Int {
        guard setArray.contains(element) else {
            return -1
        }
        for i in 0..<setArray.count {
            if setArray[i] == element {
                return i
            }
        }
        return -1
    }
    
    func getArray() -> [T] {
        setArray
    }
}
