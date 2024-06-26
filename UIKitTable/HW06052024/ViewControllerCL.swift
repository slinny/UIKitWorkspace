import UIKit

class ViewControllerCL: UIViewController {
    
    @IBOutlet weak var AddItemButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func AddButtonPressed(_ sender: Any) {
        goToAddList()
    }
}

extension ViewControllerCL: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellCL", for: indexPath) as? TableViewCellCL else { return TableViewCell() }
        
        cell.iconView.image = UIImage(systemName: checkItems[indexPath.row].icon)
        cell.titleLabel.text = checkItems[indexPath.row].title
        if checkItems[indexPath.row].remaining > 0 {
            cell.statusLabel.text = "\(checkItems[indexPath.row].remaining) Remaining"
        } else if checkItems[indexPath.row].todos.count > 0 {
            cell.statusLabel.text = "All Done!"
        } else {
            cell.statusLabel.text = "(No Items)"
        }
        
        cell.setDelegate(self)
        
        return cell
    }
}

extension ViewControllerCL: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCCI = storyboard.instantiateViewController(withIdentifier: "ViewControllerCI") as! ViewControllerCI
        let backItem = UIBarButtonItem(title: "CheckLists", image: nil, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        viewCCI.setCheckItemIndex(indexPath.row)
        self.navigationController?.pushViewController(viewCCI, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            checkItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ViewControllerCL: TableCellButtonDelegate {
    func didTapButton(in cell: UITableViewCell) {
        if let _ = tableView.indexPath(for: cell) {
            goToAddList()
        }
    }
}

extension ViewControllerCL {
    fileprivate func goToAddList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewCAddCL = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddCL") as? ViewControllerAddCL {
            setupNavigationItem()
            navigationController?.pushViewController(viewCAddCL, animated: true)
        }
    }
    
    fileprivate func setupNavigationItem() {
        let backItem = UIBarButtonItem(title: "Cancel", image: nil, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
}
