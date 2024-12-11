//
//  ObserverViewControllerA.swift
//  UIKitTable
//
//  Created by Siran Li on 12/9/24.
//

import UIKit

class ObserverViewControllerA: UIViewController {
    
    let notificationName = Notification.Name(rawValue: "Notification key")

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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
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
        let vcB = ObserverViewControllerB()
        self.navigationController?.pushViewController(vcB, animated: true)
        createObservers()
    }
}

extension ObserverViewControllerA {
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewControllerA.updateLabelText(notification:)), name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewControllerA.updateTextColor(notification:)), name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewControllerA.updateBackgroundColor(notification:)), name: notificationName, object: nil)
    }
    
    @objc func updateLabelText(notification: NSNotification) {
        label.text = "Notification received"
    }
    
    @objc func updateTextColor(notification: NSNotification) {
        label.textColor = .black
        label.backgroundColor = .white
    }
    
    @objc func updateBackgroundColor(notification: NSNotification) {
        view.backgroundColor = .white
    }
}

#Preview {
    ObserverViewControllerA()
}
