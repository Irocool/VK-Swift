//: A UIKit based Playground for presenting user interface
  
import UIKit

enum Transmission: String {
    case auto = "Автоматическая"
    case manual = "Механическая"
}

enum EngineStatus: String {
    case running = "Запущен"
    case stopped = "Не запущен"
}

enum WindowsStauts: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum TrailerStatus: String {
    case unloading = "Производится разгрузка"
    case loading = "Производится загрузка"
    case onWay = "В пути"
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
    case minivan = "Минивэн"
}

/* ///////////////////////////////////////////////////
/// 1. Создать протокол «Car» и описать свойства,  ///
/// общие для автомобилей, а также метод действия. ///
/////////////////////////////////////////////////// */

protocol Car {
    var model: String { get }
    var year: UInt16 { get }
    var trunkSpace: Int { get }
    var color: UIColor { get }
    var transmission: Transmission { get }
    var engineState: EngineStatus { get set }
    var windowsState: WindowsStauts { get set }

}


// Управление двигателем
extension Car {
    mutating func startEngine() {
        engineState = .running
    }
    
    mutating func stopEngine() {
        engineState = .stopped
    }
}

// Управление окнами
extension Car {
    mutating func openWindows() {
        windowsState = .open
    }
    
    mutating func closeWindows() {
        windowsState = .close
    }
}


extension Car {

    
    func printStatus() {
        print("""
            \n
            Модель: \(model)
            Год выпуска: \(year)
            Цвет: \(color)
            Трансмиссия: \(transmission.rawValue)
            
            Состояние окон: \(windowsState.rawValue)
            Состояние двигателя: \(engineState.rawValue)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}

class TrunkCar: Car {
    var model: String
    var year: UInt16
    var trunkSpace: Int
    var color: UIColor
    var weight: UInt
    var transmission: Transmission
    var engineState: EngineStatus = .stopped
    var windowsState: WindowsStauts = .close
    
    let liftingCapacity: Int
    let cargoWeight: Int
    let truckType: TruckType
    let trailerState: TrailerStatus
        
    init?(truckType: TruckType, liftingCapacity: Int, cargoWeight: Int, model: String, year: UInt16, trunkSpace: Int, color: UIColor, transmission: Transmission, weight: UInt, trailerState: TrailerStatus) {
        guard liftingCapacity > cargoWeight else {
            return nil
        }
        
        
        self.model = model
        self.year = year
        self.trunkSpace = trunkSpace
        self.color = color
        self.transmission = transmission
        self.weight = weight
        self.truckType = truckType
        self.liftingCapacity = liftingCapacity
        self.cargoWeight = cargoWeight
        self.trailerState = trailerState
    }
    
    func printStatus() {
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
            Состояние окон: \(windowsState.rawValue)
            Состояние двигателя: \(engineState.rawValue)
            Состояние трейлера: \(trailerState.rawValue)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}

class SportCar: Car {
    var model: String
    var year: UInt16
    var trunkSpace: Int
    var color: UIColor
    var weight: UInt
    var transmission: Transmission
    var engineState: EngineStatus = .stopped
    var windowsState: WindowsStauts = .close

    let bodyType: BodyType
    let accelerationTime: Double
    
    init?(model: String, year: UInt16, trunkSpace: Int, color: UIColor, transmission: Transmission, weight: UInt, bodyType: BodyType, accelerationTime: Double) {
        
        self.bodyType = bodyType
        self.accelerationTime = accelerationTime
        self.model = model
        self.year = year
        self.trunkSpace = trunkSpace
        self.color = color
        self.transmission = transmission
        self.weight = weight
    }
    
    func printStatus() {
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
            Состояние окон: \(windowsState.rawValue)
            Состояние двигателя: \(engineState.rawValue)
            Объем багажника: \(trunkSpace)
            \n
            """)
    }
}


extension TrunkCar: CustomStringConvertible {
    var description: String {
        let description = """
        \n
        Грузовой автомобиль. Класс TruckCar
        Тип: Грузовой
        Модель: \(model)
        Год выпуска: \(year)
        Цвет: \(color)
        Трансмиссия: \(transmission.rawValue)
        
        Масса: \(weight)
        Тип: \(truckType.rawValue)
        Грузоподъемность \(liftingCapacity)
        Вес груза: \(cargoWeight)
        Состояние окон: \(windowsState.rawValue)
        Состояние двигателя: \(engineState.rawValue)
        Состояние трейлера: \(trailerState.rawValue)
        Объем багажника: \(trunkSpace)
        """
        return description
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        let description = """
        \n
        Легковой спортивный автомобиль. Класс SportCar
        Тип: Легковой
        Модель: \(model)
        Год выпуска: \(year)
        Цвет: \(color)
        Трансмиссия: \(transmission.rawValue)
        Масса: \(weight)
        Тип: \(bodyType.rawValue)
        Разгон (0 - 100км/ч): \(accelerationTime)
        Состояние окон: \(windowsState.rawValue)
        Состояние двигателя: \(engineState.rawValue)
        Объем багажника: \(trunkSpace)
        """
        
        
        return description
    }
}


let trunkCar = TrunkCar(truckType: .truck, liftingCapacity: 25000, cargoWeight: 10000, model: "MAN", year: 2018, trunkSpace: 1500, color: .red, transmission: .auto, weight: 37000, trailerState: .onWay)

if let trunkCar = trunkCar {
    trunkCar.printStatus()
}
 
let sportCar = SportCar(model: "Toyota", year: 1998, trunkSpace: 300, color: .orange, transmission: .manual, weight: 1270, bodyType: .coupe, accelerationTime: 5.8)

if let car = sportCar {
    car.printStatus()
}


if let trunk = trunkCar {
    print(trunk)
}

if let sport = sportCar {
    print(sport)
}
