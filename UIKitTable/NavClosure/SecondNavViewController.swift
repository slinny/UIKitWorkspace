import UIKit

class SecondNavViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var data: String?
    var passDataToFirst: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = data
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let text = textField.text ?? "no value"
        passDataToFirst?(text)
    }
    
}
