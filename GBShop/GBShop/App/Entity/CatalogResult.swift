//
//  CatalogResult.swift
//  GBShop
//
//  Created by Irina Kuligina on 10.08.2021.
//

import Foundation
struct ProductResult: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
