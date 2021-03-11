//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


import UIKit

struct SportCar{
    let mark: String
    let productionDate: Date
    let carTrunk: Int
    var engineIsStarted: Bool
    var windowsIsOpen: Bool
    var filledVolumeOfTrunk: Int
    
    mutating func actions(actions:Actions){
        switch actions{
        
        case .openCloseWindows:
            self.windowsIsOpen = !windowsIsOpen
            
        case .startStopEngine:
            self.engineIsStarted = !engineIsStarted
            
        case .loadCargoInVolume(volume: let volume):
            guard volume > 0 else {
                print("Error")
                return }
            guard filledVolumeOfTrunk + volume <= carTrunk else {
                print("Overload")
                return }
            filledVolumeOfTrunk += volume
            print("loaded \(volume)")
            
        case .unloadCargoInVolume(volume: let volume):
            guard volume > 0 else {
                print("Error")
                return }
            guard volume <= filledVolumeOfTrunk else {
                print("Error")
                return }
            filledVolumeOfTrunk -= volume
            print("unload \(volume)")
            
        }
    }
    
    init(mark: String, productionDate: Date, carTrunk: Int){
        self.mark = mark
        self.productionDate = productionDate
        self.carTrunk = carTrunk
        self.engineIsStarted = false
        self.windowsIsOpen = false
        self.filledVolumeOfTrunk = 0
    }
    
    
}

struct TrunkCar{
    var mark: String
    var productionDate: Date
    var truckBody: Int
    var engineIsStarted: Bool
    var windowsIsOpen: Bool
    var filledVolumeOfTrunk: Int
}

enum Actions{
    case startStopEngine
    case openCloseWindows
    case loadCargoInVolume(volume:Int)
    case unloadCargoInVolume(volume:Int)
}



extension Date{
    static func from(year:Int) -> Date? {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComonents = DateComponents(calendar:gregorianCalendar, year: year)
        return gregorianCalendar.date(from: dateComonents)
    }
}
let ladaProductionDate = Date.from(year: 1991)
var lada = SportCar(mark: "Vaz", productionDate: ladaProductionDate!, carTrunk: 330)

print(lada)
lada.actions(actions: .loadCargoInVolume(volume: 300))
print(lada)
lada.actions(actions: .loadCargoInVolume(volume: 30))
print(lada)
lada.actions(actions: .unloadCargoInVolume(volume: 270))
print(lada)

let trunkProductionDate = Date.from(year: 2000)
var trunk = TrunkCar(mark: "Man", productionDate: trunkProductionDate!, truckBody: 30000, engineIsStarted: false, windowsIsOpen: false, filledVolumeOfTrunk: 0)
print(trunk)
