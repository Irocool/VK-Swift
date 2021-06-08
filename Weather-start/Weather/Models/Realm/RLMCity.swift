//
//  RLMCity.swift
//  Weather
//
//  Created by Irina Kuligina on 25.02.2021.
//

import Foundation
import RealmSwift

class RLMCity: Object {
    @objc dynamic var name = ""
    let weathers = List<RLMWeather>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
