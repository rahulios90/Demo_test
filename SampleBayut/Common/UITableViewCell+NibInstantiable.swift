//
//  UITableViewCell+NibInstantiable.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

protocol NibInstantiable: AnyObject {
    static var nib: UINib { get }
}

extension NibInstantiable where Self: UICollectionViewCell {
    static var nib: UINib { UINib(nibName: String(describing: Self.self), bundle: nil) }
}

extension NibInstantiable where Self: UITableViewCell {
    static var nib: UINib { UINib(nibName: String(describing: Self.self), bundle: nil) }
}
