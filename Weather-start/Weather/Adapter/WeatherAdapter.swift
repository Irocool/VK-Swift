//
//  WeatherAdapter.swift
//  Weather
//
//  Created by Irina Kuligina on 24.02.2021.
//

import Foundation
import RealmSwift

protocol WeatherAdapterProtocol: class {
    
    func getWeathers(inCity city: String, completion: @escaping ([Weather]) -> Void)
}

class WeatherAdapter: WeatherAdapterProtocol {
    
    private let weatherService = WeatherService()
    private var realmNotificationToken: [String: NotificationToken] = [:]
    
    func getWeathers(inCity city: String, completion: @escaping ([Weather]) -> Void) {
        guard let realm = try? Realm(),
            let realmCity = realm.object(ofType: RLMCity.self, forPrimaryKey: city) else { return }
        
        realmNotificationToken[city]?.stop()
        
        let token = realmCity.weathers.addNotificationBlock { [weak self] (changes) in
            guard let self = self else { return }
            
            switch changes {
            case .update(let realmWeathers, _, _, _):
                var weathers: [Weather] = []
                
                realmWeathers.forEach { (realmWeather) in
                    weathers.append(self.getWeather(from: realmWeather))
                }
                
                self.realmNotificationToken[city]?.stop()
                completion(weathers)
            case .initial:
                break
            case .error(let error):
                print(error.localizedDescription)
            }
        }
        
        realmNotificationToken[city] = token
        weatherService.loadWeatherData(city: city)
    }
    
    private func getWeather(from realmWeather: RLMWeather) -> Weather {
        return Weather(city: realmWeather.city,
                       date: Date(timeIntervalSince1970: realmWeather.date),
                       temp: realmWeather.temp,
                       pressure: realmWeather.pressure,
                       humidity: realmWeather.humidity,
                       weatherName: realmWeather.weatherName,
                       weatherIcon: realmWeather.weatherIcon,
                       windSpeed: realmWeather.windSpeed,
                       windDegrees: realmWeather.windDegrees)
    }
}
