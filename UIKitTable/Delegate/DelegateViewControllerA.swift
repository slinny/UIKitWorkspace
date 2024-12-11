// b) Create two view controllers A and B. Write simple code to demonstrate data passing from B to A using protocol delegate. [20]

import UIKit

protocol SendData {
    func sendData(_ text: String)
}

class DelegateViewControllerA: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "original text"
        // You can also add other properties here, such as:
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to B", for: .normal)
        var configuration = UIButton.Configuration.filled()
        configuration.background.cornerRadius = 10
        configuration.titlePadding = 20 // adds horizontal padding
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = configuration
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        button.addTarget(self, action: #selector(goToBTap), for: .touchUpInside)
    }
    
    @objc func goToBTap(_ sender: Any) {
        let delegateViewControllerB = DelegateViewControllerB()
        delegateViewControllerB.delegate = self
        self.navigationController?.pushViewController(delegateViewControllerB, animated: true)
    }
}

extension DelegateViewControllerA: SendData {
    func sendData(_ text: String) {
        label.text = text
    }
}

#Preview {
    DelegateViewControllerA()
}
