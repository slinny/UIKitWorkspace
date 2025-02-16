//
//  ProductViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 12/9/24.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    let image: String
    let title: String
}

class ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchProducts() {
        let products: [Product] = [
            .init(image: "image", title: "Product 1"),
            .init(image: "image", title: "Product 2"),
            .init(image: "image", title: "Product 3"),
            .init(image: "image", title: "Product 4"),
            .init(image: "image", title: "Product 5"),
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}

class ProductViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var viewModel = ProductViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white 
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    func bindTableData() {
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self)
        ) { row, model, cell in
            var contentConfiguration = UIListContentConfiguration.cell()
            contentConfiguration.text = model.title
            contentConfiguration.image = UIImage(systemName: model.image)
            cell.contentConfiguration = contentConfiguration
        }.disposed(by: bag)
        
        tableView.rx.modelDeleted(Product.self).bind { product in
            print(product.title)
        }.disposed(by: bag)
        
        viewModel.fetchProducts()
    }
}

#Preview {
    ProductViewController()
}
