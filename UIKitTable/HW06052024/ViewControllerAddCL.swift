import UIKit

class ViewControllerAddCL: UIViewController {
    
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconView: UIView!
    var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureSelectIcon()
        addItemButton()
    }
    
    fileprivate func addItemButton() {
        doneButton = UIButton(type: .custom)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemGray, for: .normal)
        doneButton.frame = CGRect(x: 300, y: 59, width: 47, height: 34)
        let doneButtonBarItem = UIBarButtonItem(customView: doneButton)
        navigationItem.rightBarButtonItem = doneButtonBarItem
        
        if let itemName = itemNameTF.text, itemName.count > 0, let iconImage = iconImageView.image {
            doneButton.setTitleColor(.systemBlue, for: .normal)
            doneButton.addTarget(self, action: #selector(doneButtonPressed(_:)), for: .touchUpInside)
        }
    }
    
    fileprivate func tapGestureSelectIcon() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        iconView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func doneButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewCAddI = storyboard.instantiateViewController(withIdentifier: "ViewControllerAddItem") as? ViewControllerAddItem {
            navigationController?.pushViewController(viewCAddI, animated: true)
        }
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCPI = storyboard.instantiateViewController(withIdentifier: "ViewControllerPickIcon") as! ViewControllerPickIcon
        navigationController?.pushViewController(viewCPI, animated: true)
    }
}
