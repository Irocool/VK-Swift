//: A UIKit based Playground for presenting user interface
  
import UIKit


struct Baggage {
    let id: Int
    let name: String
    let description: String
    let space: Int
}

enum Transmission: String {
    case auto = "Автоматическая"
    case manual = "Механическая"
}

class Car {
    let model: String
    let year: UInt16
    var trunkSpace: Int
    let color: UIColor
    let transmission: Transmission
    let weight: UInt
    
    init?(model: String, year: UInt16, trunkSpace: Int, color: UIColor, transmission: Transmission, weight: UInt) {

        self.model = model
        self.year = year
        self.trunkSpace = trunkSpace
        self.color = color
        self.transmission = transmission
        self.weight = weight
    }
    
    init() {
        self.model = "Default"
        self.year = 2020
        self.trunkSpace = 100
        self.color = .white
        self.transmission = .auto
        self.weight = 1000
    }
    

    func printStatus() {
        print("""
            \n
            Модель: \(model)
            Год выпуска: \(year)
            Цвет: \(color)
            Трансмиссия: \(transmission.rawValue)
            Масса: \(weight)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}



enum TruckType: String {

    case dumpTruck = "Самосвал"
    case garbageTruck = "Мусоровоз"
    case truck = "Тягач"
}

enum BodyType: String {
    case cabriolet = "Кабриолет"
    case coupe = "Купе"
    case hatchback = "Хэтчбек"
    case limousine = "Лимузин"
    case microvan = "Микровэн"

}


enum TrailerStatus: String {
    case unloading = "Производится разгрузка"
    case loading = "Производится загрузка"
    case onWay = "В пути"
}

enum WindowStatus: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

class TrunkCar: Car {
    let truckType: TruckType
    let liftingCapacity: Int
    let cargoWeight: Int
    var trailerState: TrailerStatus {
        didSet {
            print("Грузовик \(model). Статус трейлера: \(trailerState.rawValue)")
        }
    }

    init?(truckType: TruckType, liftingCapacity: Int, cargoWeight: Int, model: String, year: UInt16, trunkSpace: Int, color: UIColor, transmission: Transmission, weight: UInt, trailerState: TrailerStatus) {
        guard liftingCapacity > cargoWeight else {
            return nil
        }

        self.truckType = truckType
        self.liftingCapacity = liftingCapacity
        self.cargoWeight = cargoWeight
        self.trailerState = trailerState

        super.init(model: model, year: year, trunkSpace: trunkSpace, color: color, transmission: transmission, weight: weight)
    }

    override init() {
        self.truckType = .truck
        self.liftingCapacity = 15000
        self.cargoWeight = 0
        self.trailerState = .onWay
        super.init()
    }
    
    override func printStatus() {
        print("""
            \n
            Тип: Грузовой
            Модель: \(model)
            Год выпуска: \(year)
            Цвет: \(color)
            Трансмиссия: \(transmission.rawValue)
            Масса: \(weight)
            Тип: \(truckType.rawValue)
            Грузоподъемность \(liftingCapacity)
            Вес груза: \(cargoWeight)
            Состояние трейлера: \(trailerState.rawValue)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}

class SportCar: Car {
    let bodyType: BodyType
    let accelerationTime: Double
    var windowState: WindowStatus {
        didSet {
            print("Автомобиль \(model). Статус окон: \(windowState.rawValue)")
        }
    }
    
    init?(model: String, year: UInt16, trunkSpace: Int, color: UIColor, transmission: Transmission, weight: UInt, bodyType: BodyType, accelerationTime: Double, windowState: WindowStatus) {
        self.bodyType = bodyType
        self.accelerationTime = accelerationTime
        self.windowState = windowState
        super.init(model: model, year: year, trunkSpace: trunkSpace, color: color, transmission: transmission, weight: weight)
    }
    
    override init() {
        self.bodyType = .cabriolet
        self.accelerationTime = 10.0
        self.windowState = .close
        super.init()
    }
    
    override func printStatus() {
        print("""
            \n
            Тип: Легковой
            Модель: \(model)
            Год выпуска: \(year)
            Цвет: \(color)
            Трансмиссия: \(transmission.rawValue)
            Масса: \(weight)
            Тип: \(bodyType.rawValue)
            Разгон (0 - 100км/ч): \(accelerationTime)
            Состояние окон: \(windowState.rawValue)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}


let trunkCar = TrunkCar(truckType: .truck, liftingCapacity: 25000, cargoWeight: 10000, model: "MAN", year: 2018, trunkSpace: 1500, color: .red, transmission: .auto, weight: 37000, trailerState: .onWay)

if let trunkCar = trunkCar {
    trunkCar.printStatus()
    
}

let sportCar = SportCar(model: "Toyota", year: 2012, trunkSpace: 300, color: .orange, transmission: .manual, weight: 1270, bodyType: .coupe, accelerationTime: 5.8, windowState: .close)

if let car = sportCar {
    car.printStatus()
    }
    
    

if let trunkCar = trunkCar {
    trunkCar.trailerState = .loading
    trunkCar.trailerState = .onWay
    trunkCar.trailerState = .unloading
}

if let car = sportCar {
    car.windowState = .close
    car.windowState = .open
}
