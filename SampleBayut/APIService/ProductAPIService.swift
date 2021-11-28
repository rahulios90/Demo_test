//
//  ProductAPIService.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

protocol FetchProductListProtocol {
  func fetchProductList(page: Int,
                     completion: @escaping FetchProductListUseCaseCompletionHandler)
}

typealias FetchProductListUseCaseCompletionHandler = (Result<ProductResult, Error>) -> Void

// We can use facade here by having different dependencies other than API Client like local data saving

final class ProductAPIService: FetchProductListProtocol {
  
  fileprivate struct Defaults {
    static let urlString: String = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    static let searchPath: String = "/default/dynamodb-writer"
  }
  
  static let shared = ProductAPIService(apiClient: APIClient(baseUrlString: Defaults.urlString,
                                                          session: URLSession(configuration: URLSessionConfiguration.default)))
  private let apiClient: APIClientProtocol
  
  // MARK: - Private Init
  
   init(apiClient: APIClientProtocol) {
    self.apiClient = apiClient
  }
  
  // MARK: - Public Methods
  
    func fetchProductList(page: Int,
                       completion: @escaping FetchProductListUseCaseCompletionHandler) {
       
        apiClient.get(responseType: ProductResult.self,
                      urlPath: Defaults.searchPath,
                      parameters: nil) { (response, urlResponse, error) in
            
            if let response = response {
                completion(.success(response))
            }
            else if let error = error {
                completion(.failure(error))
            }
            else {
                // It will not reach here
                completion(.failure(CustomError.unknown))
            }
        }
    }
    
}
