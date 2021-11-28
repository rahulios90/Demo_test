//
//  Router.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

// Inherit from this to get basic `Router` functionality / properties.
class Router<ViewController: UIViewController> {

    private(set) weak var viewController: ViewController?
    let factory: SceneFactoryProtocol

    init(controller: ViewController, factory: SceneFactoryProtocol) {
        self.viewController = controller
        self.factory = factory
    }
}
