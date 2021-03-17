//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.

import UIKit

enum Actions{
    case startStopEngine
    case openCloseWindows
    case loadCargoInVolume(volume:Int)
    case unloadCargoInVolume(volume:Int)
    case tintCar
    case activatePlaton
}

class Car{
    
    let mark: String
    let productionDate: Date
    let carTrunk: Int
    var engineIsStarted: Bool
    var windowsIsOpen: Bool
    var filledVolumeOfTrunk: Int
    
    func actions(actions:Actions){
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
        default:
            return
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



extension Date{
    static func from(year:Int) -> Date? {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComonents = DateComponents(calendar:gregorianCalendar, year: year)
        return gregorianCalendar.date(from: dateComonents)
    }
}


class SportCar: Car{
    
    
    var windowsTint:Bool
    init(mark: String, productionDate: Date, carTrunk: Int, windowsTint: Bool) {
        self.windowsTint = windowsTint
        
        super.init(mark: mark, productionDate: productionDate, carTrunk: carTrunk)
    }
    func descriptinon(){
        print("mark: \(mark), productionDate: \(productionDate), carTrunk: \(carTrunk), engineIsStarted: \(engineIsStarted), windowsIsOpen: \(windowsIsOpen), filledVolumeOfTrunk: \(filledVolumeOfTrunk), windowsTint: \(windowsTint)")
    }
    
    override func actions(actions:Actions){
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
        case .tintCar:
            windowsTint = !windowsTint
        default:
            return
        }
    }
}
class TrunkCar: Car{
    var platon:Bool
    init(mark: String, productionDate: Date, carTrunk: Int, platon:Bool) {
        self.platon = platon
        super.init(mark: mark, productionDate: productionDate, carTrunk: carTrunk)
    }
    
    override func actions(actions:Actions){
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
            
        case .activatePlaton:
            platon = !platon
        default:
            return
        }
    }
    
    func descriptinon(){
        print("mark: \(mark), productionDate: \(productionDate), carTrunk: \(carTrunk), engineIsStarted: \(engineIsStarted), windowsIsOpen: \(windowsIsOpen), filledVolumeOfTrunk: \(filledVolumeOfTrunk), platon: \(platon)")
    }
}


let ladaDate = Date.from(year: 1991)
var lada = SportCar(mark: "Vaz", productionDate: ladaDate!, carTrunk: 300, windowsTint: true)
lada.descriptinon()
lada.actions(actions: .tintCar)
lada.descriptinon()

let mazDate = Date.from(year: 1994)
var maz = TrunkCar(mark: "Maz", productionDate: mazDate!, carTrunk: 30000, platon: true)
maz.actions(actions: .activatePlaton)
maz.descriptinon()

