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

func randomBool() -> Bool {
    return Bool.random()
}

func randomDate() -> Date {
    let randomTimeInterval = TimeInterval.random(in: 0..<(365 * 24 * 60 * 60))
    return Date(timeIntervalSinceNow: randomTimeInterval)
}

func generateRandomTodoItem() -> TodoItem {
    return TodoItem(
        finished: randomBool(),
        name: "Task \(Int.random(in: 1...100))",
        reminder: randomBool(),
        dueDate: randomDate()
    )
}

func generateRandomTodoItems(count: Int) -> [TodoItem] {
    return (0..<count).map { _ in generateRandomTodoItem() }
}

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
