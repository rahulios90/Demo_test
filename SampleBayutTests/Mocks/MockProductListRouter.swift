//
//  MockProductListRouter.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import XCTest

@testable import SampleBayut
final class MockProductListRouter: ProductListRouterProtocol {
    
    var isPushDetailScreenCalled = false
    func pushDetailScreen(_ product: Product) {
        isPushDetailScreenCalled = true
    }
}
