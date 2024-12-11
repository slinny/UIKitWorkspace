//
//  ObserverViewControllerB.swift
//  UIKitTable
//
//  Created by Siran Li on 12/9/24.
//

import UIKit

class ObserverViewControllerB: UIViewController {

    private let textF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        var configuration = UIButton.Configuration.filled()
        configuration.background.cornerRadius = 10
        configuration.titlePadding = 20 // adds horizontal padding
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = configuration
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textF)
        textF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textF.widthAnchor.constraint(equalToConstant: 200),
            textF.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textF.bottomAnchor, constant: 20).isActive = true
        button.addTarget(self, action: #selector(sendTap), for: .touchUpInside)
    }

    @objc func sendTap(_ sender: Any) {
        let name = Notification.Name(rawValue: "Notification key")
        NotificationCenter.default.post(name: name, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

#Preview {
    ObserverViewControllerB()
}
