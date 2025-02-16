//
//  MetaViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 1/10/25.
//

import Foundation
import UIKit

class MetaViewController: UIViewController {
    private let resultTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .yellow
        return table
    }()
    private let  searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search..."
        textField.backgroundColor = .yellow
        return textField
    }()
    
    private var resultContents: [SearchResult] = []
    private var serverConnection: ServerConnection = ServerConnection()
    private var searchFieldTimer: Timer?
    
    // …
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        resultTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        resultTable.delegate = self
        resultTable.dataSource = self
        
        view.addSubview(resultTable)
        view.addSubview(searchField)
        
        resultTable.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            resultTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultTable.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 20),
            resultTable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // Added constraint
            resultTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func textFieldDidChange(searchField: UITextField) {
        searchFieldTimer?.invalidate()
        
        searchFieldTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false, block: { [weak self] _ in
            guard let self = self else { return }
            guard let query = searchField.text else { return }
            
            serverConnection.autocompleteForSearchText(query) { [weak self] results in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.resultContents = results
                    self.resultTable.reloadData()
                }
            }
        })
    }
}

extension MetaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let result = resultContents[indexPath.row]
        cell.textLabel?.text = result.title
        return cell
    }
}

extension MetaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row: \(indexPath) was selected")
    }
}

#Preview {
    MetaViewController()
}

