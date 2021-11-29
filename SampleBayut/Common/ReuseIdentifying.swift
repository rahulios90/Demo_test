//
//  ReuseIdentifying.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
