import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var receivedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label?.text = receivedText
    }
}
