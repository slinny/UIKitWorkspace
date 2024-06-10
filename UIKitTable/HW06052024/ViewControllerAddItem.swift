import UIKit

class ViewControllerAddItem: UIViewController {
    
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var datepicker: UIDatePicker!
    var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameTF.delegate = self
        reminderView.addBottomBorder(with: .systemGray5, thickness: 2.0)
        addDoneButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDoneButtonState()
    }
    
    fileprivate func addDoneButton() {
        doneButton = UIButton(type: .custom)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemGray, for: .normal)
        doneButton.frame = CGRect(x: 300, y: 59, width: 47, height: 34)
        let doneButtonBarItem = UIBarButtonItem(customView: doneButton)
        navigationItem.rightBarButtonItem = doneButtonBarItem
    }
    
    fileprivate func updateDoneButtonState() {
        if let itemName = itemNameTF.text, itemName.count > 0 {
            doneButton.setTitleColor(.systemBlue, for: .normal)
            doneButton.addTarget(self, action: #selector(doneButtonPressed(_:)), for: .touchUpInside)
        } else {
            doneButton.setTitleColor(.systemGray, for: .normal)
        }
    }
    
    @objc func doneButtonPressed(_ sender: UIButton) {
        toDoItems.append(ToDoItem(finished: false, itemName: itemNameTF.text!))
        print(toDoItems.count)
        navigationController?.popViewController(animated: true)
    }
}

extension ViewControllerAddItem: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        updateDoneButtonState()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateDoneButtonState()
    }
}

extension UIView {
    func addBottomBorder(with color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - thickness, width: self.frame.size.width, height: thickness)
        self.layer.addSublayer(border)
    }
}
