//
//  WebViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 7/2/24.
//

import UIKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    private func setupButton() {
        let openWebViewButton = UIButton(type: .system)
        openWebViewButton.setTitle("Open WebView", for: .normal)
        openWebViewButton.addTarget(self, action: #selector(openWebView), for: .touchUpInside)
        
        view.addSubview(openWebViewButton)
        openWebViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openWebViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openWebViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func openWebView() {
        let webViewController = WebContentViewController()
        present(webViewController, animated: true, completion: nil)
    }
}

