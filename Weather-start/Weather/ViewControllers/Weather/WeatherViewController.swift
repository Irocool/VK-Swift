//
//  WeatherViewController.swift
//  Weather
//
//  Created by Irina Kuligina on 22.02.21.
//

import UIKit
import RealmSwift

final class WeatherViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var weekDayPicker: WeekDayPicker!
    @IBOutlet var collectionView: UICollectionView!
    
    var cityName = ""
    
//    private let weatherService = WeatherService()
//    private var weathers: List<RLMWeather>!
    
    private let viewModelFactory = WeatherViewModelFactory()
    private var viewModels = [WeatherViewModel]()

    private let weatherAdapter = WeatherAdapter()
    private var weathers: [Weather] = []
    
//    private var token: NotificationToken?
    
    private var selectedDay: Day?
    
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
        return dateFormatter
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pairTableAndRealm()
//        weatherService.loadWeatherData(city: cityName)
        
        weatherAdapter.getWeathers(inCity: cityName) { [weak self] (weathers) in
            guard let self = self else { return }
            self.weathers = weathers
            
            self.viewModels = self.viewModelFactory.constructViewModel(from: weathers)
            
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Private
    
//    private func pairTableAndRealm() {
//        guard let realm = try? Realm()
//            , let city = realm.object(ofType: RLMCity.self, forPrimaryKey: cityName)
//            else { return }
//
//        weathers = city.weathers
//
//        token = weathers.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
//            guard let collectionView = self?.collectionView else { return }
//            switch changes {
//            case .initial:
//                collectionView.reloadData()
//            case .update(_, let deletions, let insertions, let modifications):
//                collectionView.performBatchUpdates({
//                    collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0) }))
//                    collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
//                    collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0) }))
//                }, completion: nil)
//            case .error(let error):
//                fatalError("\(error)")
//            }
//        }
//    }
    
    // MARK: - Actions

    @IBAction func didSelectDay(_ sender: WeekDayPicker) {
        self.selectedDay = sender.selectedDay
        self.collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weathers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}
