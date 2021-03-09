import UIKit



//1. Написать функцию, которая определяет, четное число или нет.
func isEven(number : Int) {
    number % 2 == 0 ? print("\(number) является четным числом") : print("\(number) является нечетным числом")
}



//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divisionByThree (number : Int) {
    number % 3 == 0 ? print("\(number) делится без остатка на 3") : print("\(number) не делится без остатка на 3")
}


//3. Создать возрастающий массив из 100 чисел.
func arrayOfOneHundredItems() -> [Int] {
    var array: [Int] = []
    for i in 0..<100 {
        array.append(i)
    }
    return array
}

func arrayOfOneHundredItemsSecond() -> [Int]{
    let one = Array(1...100)
    return one
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func removeEvenAndDivisibleByThree(array: [Int]) -> [Int] {
    
    var newArray: [Int] = []
    for i in array {
        if i % 2 == 0 || i % 3 != 0{
            continue
        }
        newArray.append(i)
        
    }
    return newArray
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func appendFibonacci(n: Int, array: [Any]){
    var num1 = 0
    var num2 = 1
    var newArray = array
    for _ in 0..<n{
        let num = num1 + num2
        newArray.append(num1)
        num1 = num2
        num2 = num
        
    }
    print(newArray)
}

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
func primeNumbersArray() -> [Int]{
    var array:[Int] = []
    let max = 1000
    let items = 100
    var firstArray = Array(2...max)
    var secondArray:[Int] = []
    var p = 2
    while array.count != items{
        array.append(p)
        for number in firstArray{
            if number % p != 0 {
                secondArray.append(number)
            }
        }
        p = secondArray[0]
        firstArray = secondArray
        secondArray = []
    }
    print(array)
    return array
}

