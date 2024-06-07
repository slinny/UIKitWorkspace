import UIKit

class ViewControllerCI: UIViewController {
    
    var addButton: UIButton!
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
        
        addItemButton()
    }
    
    fileprivate func addItemButton() {
        addButton = UIButton(type: .custom)
        let image = UIImage(systemName: "plus")?
            .withTintColor(UIColor.systemBlue)
            .withRenderingMode(.alwaysOriginal)
            .scaled(to: CGSize(width: 20, height: 20))
        addButton.setImage(image, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        addButton.frame = CGRect(x: 300, y: 59, width: 47, height: 34)

        let addButtonBarItem = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = addButtonBarItem
    }

    @objc func addButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewCAddI = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddItem") as? ViewControllerAddItem {
            navigationController?.pushViewController(viewCAddI, animated: true)
        }
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
        cell.delegate = self
        
        return cell
    }
}

extension ViewControllerCI: UITableViewDelegate {
    
}

extension ViewControllerCI: TableCellButtonDelegate {
    func didTapButton(in cell: UITableViewCell) {
        if let _ = tableView.indexPath(for: cell) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewCAddI = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddItem") as? ViewControllerAddItem {
                navigationController?.pushViewController(viewCAddI, animated: true)
            }
        }
    }
}

extension UIImage {
    func scaled(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
