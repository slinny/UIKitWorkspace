//
//  Generic.swift
//  UIKitTable
//
//  Created by Siran Li on 6/27/24.
//

import Foundation

struct Generic<T> {
    private var items = [T]()
    
    mutating func addItem(item: T) {
        items.append(item)
    }
    
    func printItems() {
        print(items)
    }
    
    func getItems() -> [T] {
        return items
    }
}
