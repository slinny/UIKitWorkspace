//
//  MetaViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 11/12/24.
//

import UIKit

// Define a struct for search results
struct SearchResult {
    let id: UUID
    let title: String
    let description: String
}

// Create a ServerConnection class to handle network requests
class ServerConnection {
    func autocompleteForSearchText(_ searchText: String?, completion: @escaping ([SearchResult]) -> Void) {
        guard let query = searchText, !query.isEmpty else {
            completion([])
            return
        }
        
        // Simulate a network call with a delay (replace this with actual network request)
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let sampleResults = [
                SearchResult(id: UUID(), title: "\(query) Apple", description: "Description for Apple"),
                SearchResult(id: UUID(), title: "\(query) Banana", description: "Description for Banana"),
                SearchResult(id: UUID(), title: "\(query) Cherry", description: "Description for Cherry")
            ]
            
            completion(sampleResults)
        }
    }
}

class SearchViewController: UIViewController {
    
    // UI Components
    var resultTable: UITableView!
    var searchField: UITextField!
    
    // Data
    var resultContents: [SearchResult] = []
    var serverConnection = ServerConnection()
    private var searchDebounceTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the search field
        searchField = UITextField()
        searchField.placeholder = "Search..."
        searchField.borderStyle = .roundedRect
        searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        // Initialize the table view
        resultTable = UITableView()
        resultTable.register(UITableViewCell.self, forCellReuseIdentifier: "ResultCell")
        resultTable.dataSource = self
        resultTable.delegate = self
        
        // Add components to view
        view.addSubview(searchField)
        view.addSubview(resultTable)
        
        // Set up layout constraints
        searchField.translatesAutoresizingMaskIntoConstraints = false
        resultTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            resultTable.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10),
            resultTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Search Field Handling
    @objc private func textFieldDidChange(searchField: UITextField) {
        // Invalidate the previous timer
        searchDebounceTimer?.invalidate()
        
        // Create a new timer that triggers the network call if typing stops for 250ms
        searchDebounceTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            guard let query = searchField.text else { return }
            
            // Initiate the network call through serverConnection
            serverConnection.autocompleteForSearchText(query) { [weak self] results in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.resultContents = results
                    self.resultTable.reloadData()
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let result = resultContents[indexPath.row]
        cell.textLabel?.text = result.title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedResult = resultContents[indexPath.row]
        print("Selected item: \(selectedResult.title) - \(selectedResult.description)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
