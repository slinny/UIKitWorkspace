import Foundation

class ToDoAPIManager {
    static let shared = ToDoAPIManager()
    static let toDoURL = "https://jsonplaceholder.typicode.com/todos"
    
    func fetch(_ url: String, _ closure: @escaping ((Foundation.Data?) -> ())) {
        guard let serverURL = URL(string: url) else {
            print("url invalid")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            if let error = error {
                print("Error making request: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            closure(data)
        }.resume()
    }
}
