//
//  ProductDetailRouter.swift
//  SampleBayut
//
//  Created by OfficeUser on 30/11/21.
//

import Foundation

protocol ProductDetailRouterProtocol { }

// Extending from `Router` gives access to the currently configured viewController and the
// SceneFactory so we're able to create new Scenes
final class ProductDetailRouter: Router<ProductDetailViewController>, ProductDetailRouterProtocol {
}
