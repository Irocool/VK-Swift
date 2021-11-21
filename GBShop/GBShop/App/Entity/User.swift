//
//  User.swift
//  GBShop
//
//  Created by Irina Kuligina on 03.07.2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}

struct UserData {
    var id: Int
    var username: String
    var password: String
    var email: String

}
