//
//  RouterTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

private final class RouterTestViewController: UIViewController { }

private final class RouterTestSceneFactory: SceneFactoryProtocol {

    let id = UUID().uuidString

    func createViewController<SceneType>(_ scene: SceneType) -> SceneType.ViewControllerType where SceneType: Scene {
        return scene.createViewController()
    }
}

private final class TestRouter: Router<RouterTestViewController> { }

final class RouterTests: XCTestCase {

    func testRouter_shouldInitializeWithCustomController() {
        let controller = RouterTestViewController()
        let factory = RouterTestSceneFactory()

        let router = TestRouter(controller: controller, factory: factory)

        XCTAssertEqual(router.viewController, controller)
        XCTAssertEqual((router.factory as? RouterTestSceneFactory)?.id, factory.id)
    }
}
