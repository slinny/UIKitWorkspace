//
//  ViewControllerCL.swift
//  UIKitTable
//
//  Created by Siran Li on 6/5/24.
//

import UIKit

class ViewControllerCL: UIViewController {
    
    
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
