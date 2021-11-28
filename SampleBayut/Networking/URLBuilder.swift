//
//  URLBuilder.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

class URLBuilder {
  
  private var components: URLComponents
  
  init() {
    self.components = URLComponents()
  }
  
  convenience init(url: URL) {
    self.init()
    self.components.scheme = url.scheme
    self.components.host = url.host
  }
  
  func set(scheme: String) -> URLBuilder {
    components.scheme = scheme
    return self
  }
  
  func set(host: String) -> URLBuilder {
    components.host = host
    return self
  }

  func set(path: String) -> URLBuilder {
    var path = path
    if !path.hasPrefix("/") {
      path = "/" + path
    }
    components.path = path
    return self
  }
  
  func addParams(params: [String: String]?) -> URLBuilder {
    guard let params = params else {
      return self
    }
    var queryItems = [URLQueryItem]()
    for (key, value) in params {
      queryItems.append(URLQueryItem(name: key, value: value))
    }
    components.queryItems = queryItems
    return self
  }
  
  func build() -> URL? {
    return components.url
  }
}
