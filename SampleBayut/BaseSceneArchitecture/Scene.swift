//
//  Scene.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit
import Foundation

/// A  Scene  is a type used to create and configure a view controller
protocol Scene {
    associatedtype ViewControllerType: UIViewController

    /// Implement this to return a new instance of the view controller representing this scene.
    ///
    func createViewController() -> ViewControllerType

    /// Implement this to configure your view controller i.e. set it's view model if it's MVVM etc.
    ///
    func configure(controller: ViewControllerType, using factory: SceneFactory, context: SceneFactoryContext)
}

extension Scene where ViewControllerType: StoryboardController {

    private var sceneName: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }

    func createViewControllerFromStoryboard(bundle: Bundle?) -> ViewControllerType {
        do {
            return try ViewControllerType.instanceFromStoryboard(named: self.sceneName, bundle: bundle)
        } catch {
            fatalError("Failed to create view controller from storyboard: \(error)")
        }
    }

    /// Default implementation of createViewController
    func createViewController() -> ViewControllerType {
        return self.createViewControllerFromStoryboard(bundle: nil)
    }
}
