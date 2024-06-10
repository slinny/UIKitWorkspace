import UIKit

class FirstNavViewController: UIViewController {
    
    @IBOutlet weak var goToSecondButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToSecond(_ sender: Any) {
        print("button tapped ")
        let text = textField.text ?? "no text"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondNavViewController = storyboard.instantiateViewController(withIdentifier: "SecondNavViewController") as! SecondNavViewController
        secondNavViewController.data = text
        
        secondNavViewController.passDataToFirst = { [weak self] dataFromSecond in
            self?.textField?.text = dataFromSecond
        }
        
        print("go to second")
        self.navigationController?.pushViewController(secondNavViewController, animated: true)
    }
    
}
