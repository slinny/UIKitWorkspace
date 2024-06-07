//
//  MockData.swift
//  UIKitTable
//
//  Created by Siran Li on 6/4/24.
//

import Foundation

struct DataModel {
    var imageUrl: String
    var itemName: String
}

class MockData {
    
    static var mock1: [DataModel] = [
        DataModel(imageUrl: "hourglass", itemName: "Screen Time"),
        DataModel(imageUrl: "arrow.turn.up.forward.iphone", itemName: "Action Button")
    ]
}
