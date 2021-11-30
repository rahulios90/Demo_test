//
//  ProductListRouter.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

// Passing the protocol helps in testability
// Make sure you define all the methods here and implement them in the class
protocol ProductListRouterProtocol {

    func pushDetailScreen(_ product: Product)
}

// Extending from `Router` gives access to the currently configured viewController and the
// SceneFactory so we're able to create new Scenes
final class ProductListRouter: Router<ProductListViewController>, ProductListRouterProtocol {
    
    func pushDetailScreen(_ product: Product) {
        let productDetailScene = ProductDetailScene(product: product)
        // We cant use above line as our scene architectue is protocol based
        // let viewController = self.factory.createViewController(productDetailScene)
        
        let storyboard = UIStoryboard(name: "ProductDetailScene", bundle: Bundle.main)
        
        guard let controller = storyboard.instantiateInitialViewController() as? ProductDetailViewController,
               let factory = self.factory as? SceneFactory else { return }
        
        productDetailScene.configure(controller: controller, using: factory, context: factory.context)
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
