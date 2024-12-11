//
//  AlertViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 7/2/24.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the button
        let button = UIButton(type: .system)
        button.setTitle("Open Alert!", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        // Set the button's frame or use Auto Layout
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        view.addSubview(button)
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "alert message", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
