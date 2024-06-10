import UIKit

class ViewControllerREHomeTab: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bellImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeSearchBar()
        tableViewSetup()
    }
    
    func tableViewSetup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    
}

extension ViewControllerREHomeTab {
    func customizeSearchBar() {
        searchBar.backgroundImage = UIImage()
        
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            
            let imageView = UIImageView(image: UIImage(systemName: "building.2"))
            imageView.tintColor = .red
            imageView.frame = CGRect(x: 10, y: -10, width: 20, height: 20)
            
            let staticLabel = UILabel()
            staticLabel.text = "Search"
            staticLabel.textColor = .black
            staticLabel.sizeToFit()
            staticLabel.frame = CGRect(x: imageView.frame.width + 20, y: -10, width: 60, height: 20)
            
            let leftView = UIView()
            leftView.addSubview(imageView)
            leftView.addSubview(staticLabel)
            leftView.frame = CGRect(x: 0, y: 0, width: staticLabel.frame.width + imageView.frame.width + 10, height: searchTextField.frame.height)
            
            searchTextField.leftViewMode = .always
            searchTextField.leftView = leftView
            searchTextField.backgroundColor = .white
            searchTextField.layer.borderWidth = 0.5
            searchTextField.layer.borderColor = UIColor.lightGray.cgColor
            searchTextField.layer.cornerRadius = 15
            searchTextField.clipsToBounds = true
            searchTextField.clearButtonMode = .never
            searchTextField.placeholder = "for property for rent"
        }
    }
}

extension ViewControllerREHomeTab: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellServices", for: indexPath) as? TableViewCellServices else { return TableViewCellServices() }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellRegister", for: indexPath) as? TableViewCellRegister else { return TableViewCellRegister() }
            cell.delegate = self
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellProperty", for: indexPath) as? TableViewCellProperty else { return TableViewCellProperty() }
            return cell
        }
    }
}

extension ViewControllerREHomeTab: GetStartedButtonDelegate {
    func didTapGetStartedButton(in cell: UITableViewCell) {
        print("get started tapped!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCRELogin = storyboard.instantiateViewController(withIdentifier: "ViewControllerRELogin") as! ViewControllerRELogin
        navigationController?.pushViewController(viewCRELogin, animated: true)
    }
}

extension ViewControllerREHomeTab: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 380
        } else {
            return 150
        }
    }
}
