
import UIKit


protocol Radius {
    var radius: Int { get }
}


class Circle: Radius {
    let radius: Int
    
    init(radius: Int){
        self.radius = radius
    }
}

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

class Queue<T: Radius>{
    private var elements: [T] = []
    
    func push(element: T) {
        self.elements.append(element)
    }
    
    func pop() -> T? {
        guard !self.elements.isEmpty else { return nil }
        return self.elements.removeFirst()
    }
    
    func filter(with predicate: (T) -> Bool) -> [T] {
        var newElements = [T]()
        self.elements.forEach {
            if predicate($0) {
                newElements.append($0)
            }
        }
        elements = newElements
        return elements
    }
    
    subscript(index: Int) -> Int? {
        guard index >= 0 && index < self.elements.count else { return nil }
        return self.elements[index].radius
    }
    
    
}

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//

let circle1 = Circle(radius: 1)
let circle2 = Circle(radius: 2)
let circle3 = Circle(radius: 3)
let circle4 = Circle(radius: 4)


let stackOfCircles = Queue<Circle>()

stackOfCircles.push(element: circle1)
stackOfCircles.push(element: circle2)
stackOfCircles.push(element: circle3)
stackOfCircles.push(element: circle4)

stackOfCircles.filter { (elements) -> Bool in
    return elements.radius % 2 == 0
}

stackOfCircles.pop()
stackOfCircles.pop()

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

stackOfCircles[9]











