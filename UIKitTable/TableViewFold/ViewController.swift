/*
 Create a table view with two labels and show the data on table view from structure and pass clicked index data to another view and show it there
 
 Create a expandable and collapsable table view using section and rows
 
 tick icon and share for selected rows
 */

import UIKit

struct Data {
    var text1: String?
    var text2: String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dataArray = [Data]()
    var dataArray2 = [[String]]()
    var sectionIsExpanded: [Int: Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        
        for i in 0..<10 {
            dataArray.append(Data(text1: "text\(i) 1", text2: "text\(i) 2"))
            dataArray2.append(["String \(i) 1", "String \(i) 2"])
        }
        
        sectionIsExpanded[0] = false
        sectionIsExpanded[1] = false
    }
    
    func tableViewSetup() {
        tableView.register(UINib(nibName: "TableViewCellContent", bundle: nil), forCellReuseIdentifier: "TableViewCellContent")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionIsExpanded[section] ?? false ? (section == 0 ? dataArray.count : dataArray2.count) : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellContent", for: indexPath) as? TableViewCellContent else { return TableViewCellContent() }
        
        //        cell.tickView?.isHidden = true
        
        if indexPath.section == 0 {
            cell.label1?.text = dataArray[indexPath.row].text1
            cell.label2?.text = dataArray[indexPath.row].text2
        } else {
            cell.label1?.text = dataArray2[indexPath.row][0]
            cell.label2?.text = dataArray2[indexPath.row][1]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Data Struct" : "String"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vcC = storyboard.instantiateViewController(withIdentifier: "ViewControllerC") as? ViewControllerC {
            navigationController?.pushViewController(vcC, animated: true)
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var selectedText: String?
//        if indexPath.section == 0 {
//            selectedText = "text1: \(dataArray[indexPath.row].text1 ?? ""), text2: \(dataArray[indexPath.row].text2 ?? "")"
//        } else {
//            selectedText = "text1: \(dataArray2[indexPath.row][0]), text2: \(dataArray2[indexPath.row][1])"
//        }
//        
//        guard let textToSend = selectedText else { return }
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vcB = storyboard.instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
//            vcB.receivedText = textToSend
//            navigationController?.pushViewController(vcB, animated: true)
//        }
//    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        headerView.backgroundColor = .lightGray
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.size.width - 30, height: 30))
        titleLabel.text = section == 0 ? "Data Struct" : "String"
        titleLabel.textColor = .black
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionHeaderTapped(_:)))
        headerView.addGestureRecognizer(tapGesture)
        
        headerView.addSubview(titleLabel)
        
        headerView.tag = section
        
        return headerView
    }
    
    @objc func sectionHeaderTapped(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view else { return }
        let section = view.tag
        
        sectionIsExpanded[section]?.toggle()
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}
