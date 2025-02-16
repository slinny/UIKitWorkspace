//
//  MetaSearch20250216.swift
//  UIKitTable
//
//  Created by Siran Li on 2/16/25.
//

/*
 import UIKit

 struct SearchResult {
     let title: String
 }

 final class ServerConnection: Sendable {
     let results: [SearchResult] = [
         SearchResult(title: "apple"),
         SearchResult(title: "banana"),
         SearchResult(title: "cherry")
     ]
     func autocompleteForSearchText(_ searchText: String?, completion: @escaping @Sendable ([SearchResult]) -> Void) {
         guard let searchText = searchText, !searchText.isEmpty else {
             completion([])
             return
         }

         DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
             let filteredResults = self.results.filter{ $0.title.lowercased().contains(searchText.lowercased()) }
             completion(filteredResults)
         }
     }
 }

 class SearchViewController: UIViewController {
     
     private let resultTable = {
         let resultTable = UITableView()
         return resultTable
     }()
     
     private let searchField = {
         let searchField = UITextField()
         return searchField
     }()
     private var resultContents: [SearchResult] = []
     private let serverConnection = ServerConnection()
     private var searchTimer: Timer?
     // …
     override func viewDidLoad() {
         super.viewDidLoad()
         view.addSubview(resultTable)
         view.addSubview(searchField)
         resultTable.dataSource = self
         resultTable.delegate = self
         resultTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         resultTable.translatesAutoresizingMaskIntoConstraints = false
         searchField.translatesAutoresizingMaskIntoConstraints = false
         searchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
         NSLayoutConstraint.activate([
             searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             searchField.heightAnchor.constraint(equalToConstant: 50),
             resultTable.topAnchor.constraint(equalTo: searchField.bottomAnchor),
             resultTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             resultTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             resultTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)

         ])
     }
     
     @objc private func textFieldDidChange(searchField: UITextField) {
         searchTimer?.invalidate()
         guard let query = searchField.text else { return }
         searchTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false, block: { [weak self] timer in
             guard let self else { return }
             serverConnection.autocompleteForSearchText(query) { [weak self] results in
                 guard let self else { return }
                 DispatchQueue.main.async {
                     self.resultContents = results
                     self.resultTable.reloadData()
                 }
             }
         })
         
     }
 }

 extension SearchViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return resultContents.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = resultTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = resultContents[indexPath.row].title
         return cell
     }
 }

 extension SearchViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("Row \(indexPath.row) was selected")
     }
 }
 */
