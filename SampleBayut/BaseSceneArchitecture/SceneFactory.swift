//
//  SceneFactory.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

protocol SceneFactoryProtocol {

    func createViewController<SceneType: Scene>(_ scene: SceneType) -> SceneType.ViewControllerType
}

struct SceneFactoryContext {
}

final class SceneFactory: SceneFactoryProtocol {

    private let context: SceneFactoryContext

    init() {
        self.context = SceneFactoryContext()
    }

    /// Takes a Scene instance, creates it's view controller and then calls configure with the model objects (in the Context).
    func createViewController<SceneType: Scene>(_ scene: SceneType) -> SceneType.ViewControllerType {
        let controller = scene.createViewController()
        scene.configure(controller: controller, using: self, context: self.context)
        return controller
    }
}

