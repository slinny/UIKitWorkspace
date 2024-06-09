//
//  Data.swift
//  UIKitTable
//
//  Created by Siran Li on 6/5/24.
//

import Foundation

struct CheckItem {
    var imageName: String
    var title: String
    var status: String
}

var checkItems: [CheckItem] = {
    var checkItemList: [CheckItem] = []
    for _ in 0..<5 {
        checkItemList.append(CheckItem(imageName: "photo", title: "Title", status: "Status"))
    }
    return checkItemList
}()

struct ToDoItem {
    var finished: Bool
    var itemName: String
}

var toDoItems: [ToDoItem] = {
    var toDoItemList: [ToDoItem] = []
    for _ in 0..<5 {
        toDoItems.append(ToDoItem(finished: false, itemName: "To Do Item"))
        toDoItems.append(ToDoItem(finished: true, itemName: "To Do Item"))
    }
    return toDoItemList
}()

struct Icon {
    var iconImage: String
    var iconName: String
}

var icons: [Icon] = {
    var iconList = [Icon]()
    
    for _ in 0..<10 {
        iconList.append(Icon(iconImage: "gift", iconName: "Birthday"))
    }
    
    return iconList
}()
