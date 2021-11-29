//
//  ProductListViewModelTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import XCTest

@testable import SampleBayut

final class ProductListViewModelTests: XCTestCase {
    
    var sut: ProductListViewModel?
    private let mockAPIService = MockProductAPIService()
    private let mockRouter = MockProductListRouter()

    override func setUp() {
        super.setUp()
        sut = ProductListViewModel.init(router: mockRouter, service: mockAPIService)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    fileprivate func getJSONFromStubbedFile() -> ProductResult? {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      
      if let path = Bundle(for: type(of: self)).path(forResource: "ProductList", ofType: "json") {
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
          let result = try decoder.decode(ProductResult.self, from: data)
          
          return result
        }
        catch let error {
          print(error.localizedDescription)
        }
      }
      return nil
    }
    
    func test_fetch_products() {
        mockAPIService.successResponse = getJSONFromStubbedFile()
        let count = mockAPIService.successResponse?.data.count
        sut?.loadProducts(completionHandler: {[weak self] errorMessage in
            XCTAssert(self?.sut?.products.count == count)
        })
        
    }
    
    func test_fetch_productsEmpty() {
        // Setting it empty
        mockAPIService.successResponse = ProductResult(data: [])
        let count = mockAPIService.successResponse?.data.count
        sut?.loadProducts(completionHandler: {[weak self] errorMessage in
            XCTAssert(self?.sut?.products.count == count)
        })
    }
    
    func test_fetch_productsFailure() {
        mockAPIService.successResponse = nil
        let message = "Not found"
        mockAPIService.failureResponse = CustomError.networking(code: 404, message: message)
        sut?.loadProducts(completionHandler: { errorMessage in
            XCTAssert(errorMessage == message)
        })
    }
    
    func test_productSelected() {
        mockAPIService.successResponse = getJSONFromStubbedFile()
        mockRouter.isPushDetailScreenCalled = false
    
        sut?.loadProducts(completionHandler: { errorMessage in
        })
        sut?.productSelected(4)
        XCTAssert(mockRouter.isPushDetailScreenCalled == true)
    }
}
