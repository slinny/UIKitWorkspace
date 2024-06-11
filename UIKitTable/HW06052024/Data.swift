import Foundation

struct CheckItem {
    var icon: String
    var title: String
    var remaining: Int
    var todos: [TodoItem]
}

struct TodoItem {
    var finished: Bool
    var name: String
    var reminder: Bool
    var dueDate: Date
}

// Helper function to generate a random boolean
func randomBool() -> Bool {
    return Bool.random()
}

// Helper function to generate a random date
func randomDate() -> Date {
    let randomTimeInterval = TimeInterval.random(in: 0..<(365 * 24 * 60 * 60))
    return Date(timeIntervalSinceNow: randomTimeInterval)
}

// Helper function to generate random TodoItem
func generateRandomTodoItem() -> TodoItem {
    return TodoItem(
        finished: randomBool(),
        name: "Task \(Int.random(in: 1...100))",
        reminder: randomBool(),
        dueDate: randomDate()
    )
}

// Helper function to generate a list of random TodoItem
func generateRandomTodoItems(count: Int) -> [TodoItem] {
    return (0..<count).map { _ in generateRandomTodoItem() }
}

// Generate a list of CheckItem elements
var checkItems: [CheckItem] = (1...5).map { index in
    var todos = generateRandomTodoItems(count: Int.random(in: 3...7))
    var remaining = todos.filter { !$0.finished }.count
    
    return CheckItem(
        icon: "gift",
        title: "CheckItem \(index)",
        remaining: remaining,
        todos: todos
    )
}

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


// old data
struct CheckItem2 {
    var imageName: String
    var title: String
    var status: String
}

var checkItems2: [CheckItem2] = {
    var checkItemList: [CheckItem2] = []
    for _ in 0..<5 {
        checkItemList.append(CheckItem2(imageName: "photo", title: "Title", status: "Status"))
    }
    return checkItemList
}()

struct ToDoItem2 {
    var finished: Bool
    var itemName: String
}

var toDoItems2: [ToDoItem2] = {
    var toDoItemList: [ToDoItem2] = []
    for _ in 0..<5 {
        toDoItemList.append(ToDoItem2(finished: false, itemName: "To Do Item"))
        toDoItemList.append(ToDoItem2(finished: true, itemName: "To Do Item"))
    }
    return toDoItemList
}()
