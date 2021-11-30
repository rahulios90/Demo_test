//
//  Product.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation
/// Product is class instead of struct only because it is being used by Objective C class 
@objcMembers class Product: NSObject, Codable {
    var createdDate: String
    var price: String
    var name: String
    var imageURLs: [String]
    var thumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
        case createdDate = "created_at"
        case imageURLs = "image_urls"
        case thumbnails = "image_urls_thumbnails"
        case price, name
    }
}

class ProductResult: Codable {
    var data: [Product]
    
    init(data: [Product]) {
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "results"
    }
}
