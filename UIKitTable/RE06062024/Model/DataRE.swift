//
//  Data.swift
//  UIKitTable
//
//  Created by Siran Li on 6/6/24.
//

import Foundation

class DataRE {
    static var services: [Service] = {
        var data = [Service]()
        for _ in 0..<9 {
            data.append(Service(imageName: "building.2", title: "Property for Rent"))
        }
        return data
    }()

    static var properties: [Property] = {
        var data = [Property]()
        for _ in 0..<9 {
            data.append(Property(thumbnail: "building", price: "100,000", numberOfBeds: 2, numberOfBathrooms: 1, address: "Paradise Lake B9"))
        }
        return data
    }()
}

struct Service {
    var imageName: String
    var title: String
}

struct Property {
    var thumbnail: String
    var price: String
    var numberOfBeds: Int
    var numberOfBathrooms: Int
    var address: String
}
