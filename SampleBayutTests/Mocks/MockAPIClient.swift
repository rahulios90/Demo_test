//
//  MockAPIClient.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut
final class MockAPIClient: APIClientProtocol {
    // Not going to test with url response
    var baseURL: URL = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com")!
    var session: URLSessionProtocol = MockURLSession()
    var defaultHeaders: [String: String] = [:]
    
    var successResponse: ProductResult?
    var errorResponse: Error?
    
    func get<D: Decodable>(responseType: D.Type,
                           urlPath: String,
                           parameters: [String : String]?,
                           completion: @escaping (D?, URLResponse?, Error?) -> Void)  {
        if successResponse != nil {
            completion(successResponse as? D, nil, errorResponse)
        }
        else if errorResponse != nil {
            completion((successResponse as? D), nil, errorResponse)
        }
    }
}
