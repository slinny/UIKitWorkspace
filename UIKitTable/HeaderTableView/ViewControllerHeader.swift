//
//  ViewControllerHeader.swift
//  UIKitTable
//
//  Created by Siran Li on 6/4/24.
//

import UIKit

class ViewControllerHeader: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension ViewControllerHeader: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.mock1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else { return HeaderTableViewCell() }
        
        cell.itemImageView.image = UIImage(systemName: MockData.mock1[indexPath.row].imageUrl)
        cell.itemLabel.text = MockData.mock1[indexPath.row].itemName
        
        return cell
    }
}

extension ViewControllerHeader: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        return headerView
    }
}
