//
//  ProductListScene.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

extension ProductListViewController: StoryboardController { }
final class ProductListScene: Scene {


    // Method to configure the ViewController after it's creation
    // This is used by SceneFactory's `createViewController` method which in turn should be called by a Router instance
    func configure(controller: ProductListViewController, using factory: SceneFactory, context: SceneFactoryContext) {
        let router = ProductListRouter(controller: controller, factory: factory)
        let viewModel = ProductListViewModel(router: router,
                                          service: context.productAPIService)
        controller.viewModel = viewModel
    }
}
