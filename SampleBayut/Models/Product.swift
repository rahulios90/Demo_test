//
//  Product.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import Foundation

struct Product: Codable {
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

struct ProductResult: Codable {
    var data: [Product]
    
    enum CodingKeys: String, CodingKey {
        case data = "results"
    }
}
