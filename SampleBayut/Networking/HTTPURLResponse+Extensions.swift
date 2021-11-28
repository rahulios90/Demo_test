//
//  HTTPURLResponse+Extensions.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

extension HTTPURLResponse {
  var status: HTTPStatusCode {
    guard let status = HTTPStatusCode(rawValue: statusCode) else {
      return .undefined
    }
    return status
  }
}
