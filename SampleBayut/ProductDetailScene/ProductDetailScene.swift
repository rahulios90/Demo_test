//
//  ProductDetailScene.swift
//  SampleBayut
//
//  Created by OfficeUser on 30/11/21.
//

import Foundation

extension ProductDetailViewController: StoryboardController { }
final class ProductDetailScene: Scene {

    private let product: Product
    
    init(product: Product) {
        self.product = product
    }

    // Method to configure the ViewController after it's creation(i.e., create the ViewModel)
    // This is used by SceneFactory's `createViewController` method which in turn should be called by a Router instance
    func configure(controller: ProductDetailViewController, using factory: SceneFactory, context: SceneFactoryContext) {
        let router = ProductDetailRouter(controller: controller, factory: factory)
        let viewModel = ProductDetailViewModel(router: router,
                                            product: product)
        controller.viewModel = viewModel
    }
}
