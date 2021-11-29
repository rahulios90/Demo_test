//
//  ProductListAPIServiceTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

final class ProductListAPIServiceTests: XCTestCase {
    
    var sut: ProductAPIService?
    private let mockAPIClient = MockAPIClient()
    
    override func setUp() {
        super.setUp()
        sut = ProductAPIService(apiClient: self.mockAPIClient)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetch_products() {

        // Given A apiservice
        let sut = self.sut!

        // When fetch popular photo
        let expect = XCTestExpectation(description: "callback")
        let page = 1
        self.mockAPIClient.successResponse = ProductResult(data: [])
        self.mockAPIClient.errorResponse = nil
        sut.fetchProductList(page: page) { result in
            switch result {
            case .success(let productResult):
                expect.fulfill()
                XCTAssert(productResult.data.isEmpty)
                
            case .failure:
                expect.fulfill()
                // As per our test it will not come here
            }
        }

        wait(for: [expect], timeout: 3.1)
    }
    
}
