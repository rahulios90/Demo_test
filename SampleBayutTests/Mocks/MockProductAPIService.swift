//
//  MockProductAPIService.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

final class MockProductAPIService: FetchProductListProtocol {
    
    var successResponse: ProductResult?
    var failureResponse: Error?
    
    func fetchProductList(page: Int, completion: @escaping FetchProductListUseCaseCompletionHandler) {
        if let products = successResponse {
            completion(.success(products))
        }
        else if let error = failureResponse {
            completion(.failure(error))
        }
        else {
            completion(.failure(CustomError.unknown))
        }
    }
}
