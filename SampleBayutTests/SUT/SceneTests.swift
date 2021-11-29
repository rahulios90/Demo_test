//
//  SceneTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

private let bundle = Bundle(for: SceneTests.self)

// This can't be private because it's being referenced in a Storyboard. _Sigh_
final class TestStoryboardViewController: UIViewController, StoryboardController { }

private final class TestScene: Scene {
    func configure(controller: TestStoryboardViewController, using factory: SceneFactory, context: SceneFactoryContext) { }
}

final class SceneTests: XCTestCase {

    // Test the protocol extension which automatically implements createViewController
    func testScene_CreatesViewControllerFromStoryboard() {
        let scene = TestScene()
        XCTAssertNoThrow(scene.createViewControllerFromStoryboard(bundle: bundle))
    }
}
