import UIKit

class ViewControllerAddCL: UIViewController {
    
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureSelectIcon()
    }
    
    fileprivate func tapGestureSelectIcon() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        iconView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCPI = storyboard.instantiateViewController(withIdentifier: "ViewControllerPickIcon") as! ViewControllerPickIcon
        navigationController?.pushViewController(viewCPI, animated: true)
    }
}
