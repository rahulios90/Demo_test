//
//  APIClientTests.swift
//  SampleBayutTests
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
import XCTest

@testable import SampleBayut

final class APIClientTests: XCTestCase {
    #warning("The url should be only test base url, production url will create issue as this may hamper real analytics data for apis on server")
   private let testBaseURL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
   private let urlPath = "/default/dynamodb-writer"

    func testGET() {
        // We can have this test with stub data too, as this may hamper real analytics data for apis on server
        let mockURLSession = MockURLSession()
        let expectation = XCTestExpectation(description: "Expect to send get request")

        let networking = APIClient(baseUrlString: testBaseURL, session: mockURLSession)
    
        networking.get(responseType: MockProduct.self,
                       urlPath: urlPath,
                       parameters: nil) { response, urlResponse, error in
            if response != nil {
                XCTAssert(error == nil)
                expectation.fulfill()
            }
            else if error != nil {
                XCTAssert(response == nil)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testGETSuccess() {
        let expectation = XCTestExpectation(description: "Expect to  get success")
        let mockURLSession = MockURLSession()
        let networking = APIClient(baseUrlString: testBaseURL, session: mockURLSession)
        let mockedResponse = MockProduct(id: 2)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(mockedResponse) {
            // save `encoded` somewhere
            mockURLSession.nextData = encoded
        }
       
        mockURLSession.nextError = nil
        
        networking.get(responseType: MockProduct.self,
                       urlPath: urlPath,
                       parameters: nil) { response, urlResponse, error in
            XCTAssert(error == nil)
            XCTAssert(response != nil)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGETFailure() {
        let mockURLSession = MockURLSession()
        let expectation = XCTestExpectation(description: "Expect to  get failure")
        let networking = APIClient(baseUrlString: testBaseURL, session: mockURLSession)
        mockURLSession.nextData = nil
        mockURLSession.nextError = CustomError.unknown
        
        networking.get(responseType: MockProduct.self,
                       urlPath: urlPath,
                       parameters: nil) { response, urlResponse, error in
            XCTAssert(error != nil)
            XCTAssert(response == nil)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

}

struct MockProduct: Codable {
    let id: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
    }
}
