//
//  SceneFactoryTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

private final class TestViewController: UIViewController { }

private final class MockScene<T: UIViewController>: Scene {
    private(set) var controller: T?

    var hasCreated: Bool { return self.controller != nil }
    private(set) var hasConfigured = false

    func createViewController() -> T {
        let controller = T()
        self.controller = controller
        return controller
    }

    func configure(controller: T, using factory: SceneFactory, context: SceneFactoryContext) {
        XCTAssertNotNil(self.controller, "Should have created a controller before calling \(#function)")
        XCTAssertEqual(controller, self.controller, "Was expecting created controller \(self.controller.map(String.init) ?? "nil"), recieved \(controller)")
        self.hasConfigured = true
    }
}

final class SceneFactoryTests: XCTestCase {

    func testSceneFactory_shouldConfigureScene() {

        let factory = SceneFactory(productAPIService: MockProductAPIService())

        let scene = MockScene<TestViewController>()

        _ = factory.createViewController(scene)

        XCTAssertTrue(scene.hasCreated, "The factory should have called 'createViewController'")
        XCTAssertTrue(scene.hasConfigured, "The factory should have called 'configure(controller:using:context:)'")
    }
}

