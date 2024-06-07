import UIKit

class ViewControllerCL: UIViewController {
    
    @IBOutlet weak var AddItemButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var checkItems = [CheckItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<5 {
            checkItems.append(CheckItem(imageName: "photo", title: "Title", status: "Status"))
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func AddButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewCAddCL = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddCL") as? ViewControllerAddCL {
            navigationController?.pushViewController(viewCAddCL, animated: true)
        }
    }
    
}

extension ViewControllerCL: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellCL", for: indexPath) as? TableViewCellCL else { return TableViewCell() }
        
        cell.itemImageView.image = UIImage(systemName: checkItems[indexPath.row].imageName)
        cell.titleLabel.text = checkItems[indexPath.row].title
        cell.statusLabel.text = checkItems[indexPath.row].status
        cell.delegate = self
        
        return cell
    }
}

extension ViewControllerCL: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCCI = storyboard.instantiateViewController(withIdentifier: "ViewControllerCI") as! ViewControllerCI
        self.navigationController?.pushViewController(viewCCI, animated: true)
    }
}

extension ViewControllerCL: TableCellButtonDelegate {
    func didTapButton(in cell: UITableViewCell) {
        if let _ = tableView.indexPath(for: cell) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewCAddCL = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddCL") as? ViewControllerAddCL {
                navigationController?.pushViewController(viewCAddCL, animated: true)
            }
        }
    }
}
