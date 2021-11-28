//
//  UIViewController+Storyboard.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

enum ViewControllerFromStoryboardError: Error {
    case failedToFindInitial(storyboard: UIStoryboard)
    case initialViewControllerInvalidType(expected: Any.Type, found: Any.Type)
}

/// This protocol automagically allows UIViewController subclasses to have an `instanceFromStoryboard(named:bundle:)` method which will
/// find the correct storyboard and load the initial view controller, returning it cast to `Self`.
/// It's then cast to `Self` which requires this to be a protocol, and not just a plain extension on `UIViewController`.
protocol StoryboardController where Self: UIViewController {

    /// Creates a view controller using the name of the controller to load a storyboard
    ///
    static func instanceFromStoryboard(named name: String?, bundle: Bundle?) throws -> Self
}

extension StoryboardController where Self: UIViewController {

    static func instanceFromStoryboard(named name: String? = nil, bundle: Bundle? = nil) throws -> Self {
        let defaultName = name ?? String(describing: self).components(separatedBy: ".").last!
        
        let storyboard = UIStoryboard(name: defaultName, bundle: bundle)

        guard let candidate = storyboard.instantiateInitialViewController() else {
            throw ViewControllerFromStoryboardError.failedToFindInitial(storyboard: storyboard)
        }

        guard let controller = candidate as? Self else {
            throw ViewControllerFromStoryboardError.initialViewControllerInvalidType(expected: Self.self, found: type(of: candidate))
        }

        return controller
    }
}
