//
//  WeatherCell.swift
//  Weather
//
//  Created by Евгений Елчев on 22.02.21.
//  Copyright © 2017 JonFir. All rights reserved.
//

import UIKit

final class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.layer.shadowOffset = .zero
            self.shadowView.layer.shadowOpacity = 0.75
            self.shadowView.layer.shadowRadius = 6
        }
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.clipsToBounds = true
        }
    }
    
//    static let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
//        return dateFormatter
//    }()
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.shadowView.layer.shadowPath = UIBezierPath(ovalIn: self.shadowView.bounds).cgPath
        self.containerView.layer.cornerRadius = self.containerView.frame.width / 2
    }
    
//    func configure(with weather: RLMWeather) {
//        let date = Date(timeIntervalSince1970: weather.date)
//        let stringDate = WeatherCell.dateFormatter.string(from: date)
//
//        weatherLabel.text = String(Int(round(weather.temp)))
//        time.text = stringDate
//        icon.image = UIImage(named: weather.weatherIcon)
//
//        let color = min(abs(weather.temp) * 10, 255) / 255
//        if weather.temp <= 0 {
//            self.shadowView.layer.shadowColor = UIColor(red: 0, green: 0.2, blue: CGFloat(color), alpha: 1).cgColor
//        } else {
//            self.shadowView.layer.shadowColor = UIColor(red: CGFloat(color), green: 0, blue: 0, alpha: 1).cgColor
//        }
//    }
    
//    func configure(with weather: Weather) {
//        let stringDate = WeatherCell.dateFormatter.string(from: weather.date)
//
//        weatherLabel.text = String(Int(round(weather.temp)))
//        time.text = stringDate
//        icon.image = UIImage(named: weather.weatherIcon)
//
//        let color = min(abs(weather.temp) * 10, 255) / 255
//        if weather.temp <= 0 {
//            self.shadowView.layer.shadowColor = UIColor(red: 0, green: 0.2, blue: CGFloat(color), alpha: 1).cgColor
//        } else {
//            self.shadowView.layer.shadowColor = UIColor(red: CGFloat(color), green: 0, blue: 0, alpha: 1).cgColor
//        }
//    }
    
    func configure(with weather: WeatherViewModel) {
        weatherLabel.text = weather.weatherText
        time.text = weather.dateText
        icon.image = weather.iconImage
        shadowView.layer.shadowColor = weather.shadowColor.cgColor
    }
}
