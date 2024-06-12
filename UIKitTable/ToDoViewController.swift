import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var todoTable: UITableView!
    var todos: [ToDoUnit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        fetchData()
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todoTable.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as? ToDoTableViewCell else { return ToDoTableViewCell() }
        
        cell.userIDLabel.text = "UserID: \(todos[indexPath.row].userId)"
        cell.idLabel.text = "ID: \(todos[indexPath.row].id)"
        cell.titleLabel.text = "Title: \(todos[indexPath.row].title)"
        cell.completedLabel.text = "Completed: \(todos[indexPath.row].completed)"
        
        return cell
    }
}

extension ToDoViewController {
    fileprivate func setupTable() {
        todoTable.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoTableViewCell")
        todoTable.dataSource = self
    }
    
    fileprivate func fetchData() {
        ToDoAPIManager.shared.fetch(ToDoAPIManager.toDoURL) { data in
            guard let serverData = data else {
                print("No data received from server")
                return
            }
            
            print("Data received from server")
            
            do {
                let apiResponse = try JSONDecoder().decode([ToDoUnit].self, from: serverData)
                DispatchQueue.main.async {
                    self.todos = apiResponse
                    self.todoTable.reloadData()
                }
            } catch {
                print("Failed to decode API response: \(error)")
            }
        }
    }
}
