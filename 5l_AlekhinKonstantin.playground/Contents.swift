import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.


protocol Car {
    var doors:Int { get }
    var wheels:Int { get }
    var windowsIsOpened: Bool { get set }
    var engineIsStarted: Bool { get set }
    
    func horn()
}

extension Car {
    mutating func openWindows() {
        windowsIsOpened = !windowsIsOpened
    }
    mutating func startEngine() {
        engineIsStarted = !engineIsStarted
    }
    
}

class TrunkCar: Car {
    var doors: Int
    var wheels: Int
    var windowsIsOpened: Bool
    var engineIsStarted: Bool
    var trunkVolume: Int
    
    func horn() {
        print("BEEP")
    }
    
    init(doors: Int, wheels: Int, windowsIsOpened: Bool, engineIsStarted: Bool, trunkVolume: Int  ) {
        self.doors = doors
        self.wheels = wheels
        self.windowsIsOpened = windowsIsOpened
        self.engineIsStarted = engineIsStarted
        self.trunkVolume = trunkVolume
    }
    
}

class SportCar: Car {
    var doors: Int
    var wheels: Int
    var windowsIsOpened: Bool
    var engineIsStarted: Bool
    var spoiler: Bool
    
    func horn() {
        print("BEEP")
    }
    
    init(doors: Int, wheels: Int, windowsIsOpened: Bool, engineIsStarted: Bool, spoiler: Bool ) {
        self.doors = doors
        self.wheels = wheels
        self.windowsIsOpened = windowsIsOpened
        self.engineIsStarted = engineIsStarted
        self.spoiler = spoiler
    }
    
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return ("doors: \(doors), wheels \(wheels), windowsIsOpened \(windowsIsOpened), engineIsStarted \(engineIsStarted), trunkVolume \(trunkVolume)")
    }
    
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return ("doors: \(doors), wheels \(wheels), windowsIsOpened \(windowsIsOpened), engineIsStarted \(engineIsStarted), spoiler \(spoiler)")
    }
    
    
}

var lada = SportCar(doors: 3, wheels: 4, windowsIsOpened: false, engineIsStarted: false, spoiler: true)

print(lada.description)
lada.startEngine()
print(lada.description)

var kamaz = TrunkCar(doors: 2, wheels: 8, windowsIsOpened: false, engineIsStarted: false, trunkVolume: 9500)

print(kamaz.description)
kamaz.openWindows()
print(kamaz.description)
