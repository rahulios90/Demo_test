//
//  ProductDetailViewModel.swift
//  SampleBayut
//
//  Created by OfficeUser on 30/11/21.
//

import Foundation

@objcMembers final class ProductDetailViewModel: NSObject {
    private let router: ProductDetailRouterProtocol
    let product: Product

    init(router: ProductDetailRouterProtocol,
         product: Product) {
        self.router = router
        self.product = product
    }
}
