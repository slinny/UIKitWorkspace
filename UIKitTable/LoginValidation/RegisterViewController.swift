/*
 design a login screen where you have user name and password and criteria is username should have alpha characters and it cant be more than 8 characters long and for password it can be any characters and it shouldnt be more than 12 chracters and minimum 8 chracters . write down the test cases for validating username and password
 and once it validate navigate to next screen.
 */

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var finishRegisterButton: UIButton!
    
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let textField = UITextField()
    }
    
    func validateUsername(_ username: String?) -> Bool {
        guard let username = username else { return false }
        guard username.count <= 8 else { return false }
        
        for char in username {
            if !char.isLetter {
                return false
            }
        }

        return true
    }
    
    func validatePassword(_ password:String?) -> Bool {
        guard let password = password else { return false }
        guard password.count >= 8, password.count <= 12 else { return false }
        return true
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        username = usernameTF?.text
        password = passwordTF?.text
        
        guard validateUsername(username) else {
            print("username is invalid")
            return
        }
        
        guard validatePassword(password) else {
            print("password is invalid")
            return
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewCS = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(viewCS, animated: true)
    }
}
