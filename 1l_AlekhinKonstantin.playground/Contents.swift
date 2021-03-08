import UIKit

//1. Решить квадратное уравнение.
func quadraticEquation(coefficientA a: Double,
                       coefficientB b: Double,
                       coefficientC c: Double ) {
    
    let discriminant = (b*b) - 4*a*c
    
    switch discriminant {
    
    case _ where discriminant == 0:
        let x = (-b) / (2*a)
        print("Есть один корень: x = \(x)")
        
    case _ where discriminant > 0:
        let x1 = ((-b) + discriminant.squareRoot()) / (2*a)
        let x2 = ((-b) - discriminant.squareRoot()) / (2*a)
        print("Есть два различных корня: x1 = \(x1), x2 = \(x2)")
        
    default:
        print("Корней нет")
    }
}


//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
func rightTriangle(leg1: Double, leg2: Double) {
    let area = (leg1 * leg2) / 2
    let squareHypotenuse = (leg1 * leg1) + (leg2 * leg2)
    let hypotenuse = squareHypotenuse.squareRoot()
    let perimeter = leg1 + leg2 + hypotenuse
    print("Площадь равна \(area) ,периметр равен \(perimeter),гипотенуза равна \(hypotenuse)")
}



//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
func fiveYearsDeposit(depositAmount: Double, interest: Double) {
    let years : Double = 5
    let annualMultiplier = 1 + ((interest / 100) / 1)
    let fiveYearsMultiplier = pow(annualMultiplier, years)
    let totalAmount = depositAmount * fiveYearsMultiplier
    print("Сумма вклада через пять лет составит \((totalAmount * 100).rounded() / 100)")
}



