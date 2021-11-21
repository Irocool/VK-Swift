//: A UIKit based Playground for presenting user interface
  
import UIKit


enum Transmission {
    case manual
    case auto
}

enum EngineStatus {
    case running
    case stopped
}

enum WindowStatus {
    case open
    case close
}

enum LockStatus {
    case open
    case close
}

struct SportCar {
    let model: String
    let year: Int
    var engineState: EngineStatus {
        didSet {
            if engineState == .stopped {
                print("Двигатель автомобиля не запущен.")
            } else {
                print("Двигаетль автомобиля запущен.")
            }
        }
    }
    var windowState: WindowStatus {
        didSet {
            if windowState == .close {
                print("Окна автомобиля закрыты.")
            } else {
                print("Окна автомобиля открыты.")
            }
        }
    }
    
    
    var lockState: LockStatus { // Закрыт автомобиль или открыт
        didSet {
            if lockState == .close {
                print("Замок автомобиля закрыт.")
            } else {
                print("Замок автомобиля открыт.")
            }
        }
    }
    
    
    let bluetooth: Bool
    let transmisson: Transmission
    let mileage: Int
    
    mutating func changelockState(to state: LockStatus) {
        // Предположим что когда мы закрываем автомобиль - закрываются окна
        if lockState == .open {
            lockState = .close
            windowState = .close
        } else {
            lockState = .open
        }
    }
    
    
    func printData() {
        print("""
            \nСпортивный автомобиль модели: \(model)
            Год выпуска: \(year)
            Трансмиссия: \(transmisson)
            Пробег: \(mileage) km
            Статус двигателя: \(engineState)
            Статус окон: \(windowState)
            Статус замка: \(lockState)
            """)
    }
}

/* Инициализация структур */

var Volvo = SportCar(model: "Volvo", year: 2020, engineState: .stopped, windowState: .close, lockState: .close, bluetooth: true, transmisson: .auto, mileage: 2000)

Volvo.lockState = .open
Volvo.windowState = .open
Volvo.engineState = .running

print()
Volvo.printData()

