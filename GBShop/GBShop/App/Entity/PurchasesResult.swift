//
//  Purchases.swift
//  GBShop
//
//  Created by Irina Kuligina on 10.08.2021.
//

import Foundation

struct PurchasesResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
