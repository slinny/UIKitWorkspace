import UIKit

class ViewControllerPickIcon: UIViewController {
    
    @IBOutlet weak var iconTableView: UITableView!
    var delegate: SendData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconTableView.register(UINib(nibName: "TableViewCellPickIcon", bundle: nil), forCellReuseIdentifier: "TableViewCellPickIcon")
        iconTableView.dataSource = self
        iconTableView.delegate = self
    }
}

extension ViewControllerPickIcon: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellPickIcon", for: indexPath) as? TableViewCellPickIcon else { return TableViewCellPickIcon() }
        
        cell.iconImageView.image = UIImage(systemName: icons[indexPath.row].iconImage)
        cell.iconNameLabel.text = icons[indexPath.row].iconName
        
        return cell
    }
}

extension ViewControllerPickIcon: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sendData(icons[indexPath.row].iconImage)
        navigationController?.popViewController(animated: true)
    }
}
