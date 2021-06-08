//
//  WeatherViewModelFactory.swift
//  Weather
//
//  Created by Irina Kuligina on 25.02.2021.
//

import UIKit

class WeatherViewModelFactory {
    
    func constructViewModel(from weathers: [Weather]) -> [WeatherViewModel]  {
        return weathers.map { getViewModel(from: $0) }
    }
    
    private func getViewModel(from weather: Weather) -> WeatherViewModel {
        let dateString = WeatherViewModelFactory.dateFormatter.string(from: weather.date)

        let weartherText  = String(Int(round(weather.temp)))
        let iconImage = UIImage(named: weather.weatherIcon)

        let color = min(abs(weather.temp) * 10, 255) / 255
        let shadowColor: UIColor
        if weather.temp <= 0 {
            shadowColor = UIColor(red: 0, green: 0.2, blue: CGFloat(color), alpha: 1)
        } else {
            shadowColor = UIColor(red: CGFloat(color), green: 0, blue: 0, alpha: 1)
        }
        
        return WeatherViewModel(weatherText: weartherText,
                                dateText: dateString,
                                iconImage: iconImage,
                                shadowColor: shadowColor)
    }
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
        return dateFormatter
    }()
}
