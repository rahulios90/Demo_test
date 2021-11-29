//
//  ProductListViewController.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

final class ProductListViewController: UIViewController {
    
    private enum UIConstants {
        static let estimatedRowHeight = CGFloat(80)
    }
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel: ProductListViewModelProtocol!
   
    override func viewDidLoad() {
        super .viewDidLoad()
        configureTableView()
        configureLoadMoreView()
        loadData()
    }
    
    // MARK: Private Methods
    
    private func loadData() {
        viewModel.loadProducts { [weak self] errorMessage in
            guard let self = self else { return }
            guard let message = errorMessage else {
                self.tableView.isHidden = false
                self.tableView.reloadData()

                if self.viewModel.allItemsLoaded {
                    self.tableView.tableFooterView = nil
                }
                return
            }
            
            self.showError(message)
        }
    }

    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Message",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Load more functionality as list should have this
    private func configureLoadMoreView() {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 44)
        self.tableView.tableFooterView = spinner
    }
    
    private func configureTableView() {
        tableView.isHidden = true
        tableView.register(ProductInfoTableViewCell.nib, forCellReuseIdentifier: ProductInfoTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UIConstants.estimatedRowHeight
    }
}

// MARK: Data source and delegate methods of table view

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        ProductInfoTableViewCell.reuseIdentifier) as? ProductInfoTableViewCell else {
            fatalError()
        }

        cell.configure(self.viewModel.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let dataSourceCount = self.viewModel.products.count
        if (indexPath.row == (dataSourceCount - 1) && !viewModel.allItemsLoaded) {
            loadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.productSelected(indexPath.row)
    }
    
}
