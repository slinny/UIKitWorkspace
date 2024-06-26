import UIKit

class ViewControllerAddCL: UIViewController {
    
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconView: UIView!
    private var doneButton: UIButton!
    private var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconImageView.tintColor = .black
        itemNameTF.delegate = self 
        tapGestureSelectIcon()
        addDoneButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDoneButtonState()
    }
    
    deinit {
        itemNameTF.delegate = nil 
    }
    
    @objc func doneButtonPressed(_ sender: UIButton) {
        checkItems.append(CheckItem(icon: imageName, title: itemNameTF.text!, remaining: 0, todos: []))
        navigationController?.popViewController(animated: true)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCPI = storyboard.instantiateViewController(withIdentifier: "ViewControllerPickIcon") as! ViewControllerPickIcon
        viewCPI.setDelegate(self)
        navigationController?.pushViewController(viewCPI, animated: true)
    }
}

extension ViewControllerAddCL: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        updateDoneButtonState()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateDoneButtonState()
    }
}

extension ViewControllerAddCL: SendString {
    func sendString(_ data: String) {
        self.iconImageView.image = UIImage(systemName: data)
        self.imageName = data
        updateDoneButtonState()
    }
}

extension ViewControllerAddCL {    
    fileprivate func addDoneButton() {
        doneButton = UIButton(type: .custom)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemGray, for: .normal)
        doneButton.frame = CGRect(x: 300, y: 59, width: 47, height: 34)
        let doneButtonBarItem = UIBarButtonItem(customView: doneButton)
        navigationItem.rightBarButtonItem = doneButtonBarItem
        
        updateDoneButtonState()
    }
    
    fileprivate func updateDoneButtonState() {
        if let itemName = itemNameTF.text, itemName.count > 0, let _ = iconImageView.image {
            doneButton.setTitleColor(.systemBlue, for: .normal)
            doneButton.addTarget(self, action: #selector(doneButtonPressed(_:)), for: .touchUpInside)
        } else {
            doneButton.setTitleColor(.systemGray, for: .normal)
        }
    }
    
    fileprivate func tapGestureSelectIcon() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        iconView.addGestureRecognizer(tapGestureRecognizer)
    }
}
