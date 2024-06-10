import UIKit

class ViewControllerRELogin: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var facebookLogin: UIView!
    @IBOutlet weak var googleLogin: UIView!
    @IBOutlet weak var appleLogin: UIView!
    @IBOutlet weak var emailLogin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        // Ensure user interaction is enabled
        facebookLogin.isUserInteractionEnabled = true
        googleLogin.isUserInteractionEnabled = true
        appleLogin.isUserInteractionEnabled = true
        emailLogin.isUserInteractionEnabled = true
        
        // Add tap gestures
        let tapGestureFacebookLogin = UITapGestureRecognizer(target: self, action: #selector(facebookLoginAction))
        facebookLogin.addGestureRecognizer(tapGestureFacebookLogin)
        
        let tapGestureGoogleLogin = UITapGestureRecognizer(target: self, action: #selector(googleLoginAction))
        googleLogin.addGestureRecognizer(tapGestureGoogleLogin)
        
        let tapGestureAppleLogin = UITapGestureRecognizer(target: self, action: #selector(appleLoginAction))
        appleLogin.addGestureRecognizer(tapGestureAppleLogin)
        
        let tapGestureEmailLogin = UITapGestureRecognizer(target: self, action: #selector(emailLoginAction))
        emailLogin.addGestureRecognizer(tapGestureEmailLogin)
        
        // Set the border and corner radius
        setupLoginView(facebookLogin)
        setupLoginView(googleLogin)
        setupLoginView(appleLogin)
        setupLoginView(emailLogin)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupLoginView(_ view: UIView) {
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8.0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func facebookLoginAction() {
        print("facebook")
        showAlert(withTitle: "facebook")
    }
    
    @objc func googleLoginAction() {
        print("google")
        showAlert(withTitle: "google")
    }
    
    @objc func appleLoginAction() {
        print("apple")
        showAlert(withTitle: "apple")
    }
    
    @objc func emailLoginAction() {
        print("email")
        showAlert(withTitle: "email")
    }
    
    func showAlert(withTitle title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
