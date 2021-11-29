//
//  ProductListViewModel.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

protocol ProductListViewModelProtocol {
    var allItemsLoaded: Bool { get }
    var products: [Product]  { get }
    func loadProducts(completionHandler: @escaping (_ errorInfo: String?) -> Void)
    func productSelected(_ row: Int)
}

final class ProductListViewModel: ProductListViewModelProtocol {

    private let router: ProductListRouterProtocol
    private let service: FetchProductListProtocol
    private var isFetchInProgress = false
    private(set) var allItemsLoaded: Bool = false
    private(set) var products: [Product] = []
    
    init(router: ProductListRouterProtocol,
         service: FetchProductListProtocol) {
        self.router = router
        self.service = service
    }
    
    // MARK: API call
    
    func loadProducts(completionHandler: @escaping (_ errorInfo: String?) -> Void) {
        guard !isFetchInProgress else { return }
        
        isFetchInProgress = true
        // No paging in api
        service.fetchProductList(page: 0 , completion: { [weak self] result in
            switch result {
            case .success(let response):
                // It means there are no more pages to fetch
                if (response.data.count == 0) {
                    self?.isFetchInProgress = false
                    self?.allItemsLoaded = true
                    completionHandler(nil)
                    return
                }
                self?.isFetchInProgress = false
                self?.products = response.data
                completionHandler(nil)
            case .failure(let error):
                self?.isFetchInProgress = false
                completionHandler(error.localizedDescription)
            }
        })
    }
    
    func productSelected(_ row: Int) {
        router.pushDetailScreen(products[row])
    }

}
