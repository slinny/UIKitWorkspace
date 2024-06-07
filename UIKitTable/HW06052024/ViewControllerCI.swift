//
//  ViewControllerCLDetail.swift
//  UIKitTable
//
//  Created by Siran Li on 6/5/24.
//

import UIKit

class ViewControllerCI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<5 {
            toDoItems.append(ToDoItem(finished: false, itemName: "To Do Item"))
            toDoItems.append(ToDoItem(finished: true, itemName: "To Do Item"))
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewControllerCI: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellCI", for: indexPath) as? TableViewCellCI else { return TableViewCellCI() }
        
        cell.checkImageView.isHidden = !toDoItems[indexPath.row].finished
        cell.checkItemLabel.text = toDoItems[indexPath.row].itemName
        
        return cell
    }
}

extension ViewControllerCI: UITableViewDelegate {
    
}
