/*
 Create a tableview with 20 rows and start with 1
 With index as string
 Programatically
 Select a cell and change the text to “HELLO Selected (index)”
 And on reselection change it to the original value


 Note: NO Storyboard, NO Outlet,  No XIB only design tableview by code.
 */

import UIKit

class ViewControllerC: UIViewController {
    
    var tableView: UITableView!
//    var originalTexts: [String] = []
    var selectedIndex: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
//        for i in 1...20 {
//            originalTexts.append("\(i)")
//        }
    }
}

extension ViewControllerC:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
//        return originalTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if selectedIndex == indexPath.row {
            cell.textLabel?.text = "HELLO Selected \(indexPath.row + 1)"
        } else {
            cell.textLabel?.text = String(indexPath.row + 1)
//            cell.textLabel?.text = originalTexts[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newSelectedIndex = indexPath.row
        
        if let oldSelectedIndex = selectedIndex, oldSelectedIndex != newSelectedIndex {
            let oldIndexPath = IndexPath(row: oldSelectedIndex, section: 0)
            selectedIndex = nil
            tableView.reloadRows(at: [oldIndexPath], with: .automatic)
        }
        
        if selectedIndex == newSelectedIndex {
            selectedIndex = nil
        } else {
            selectedIndex = newSelectedIndex
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


extension ViewControllerC: UITableViewDelegate {
    
}

