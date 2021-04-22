
import UIKit


struct Reader {
    let name: String
    var debt: Int
}

enum LibraryErrors: Error {
    case intruder
    case debtor
    case noBook
}

var readers = [
    "Alice": Reader(name: "Alice", debt: 0),
    "Bob": Reader(name: "Bob", debt: 1),
    "Eve": Reader(name: "Eve", debt: 0)
]

let books = ["Manual", "Gide", "Tutorial"]



////1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

class LibraryOne {
    func takeBook(reader: String, book: String) -> (String?, LibraryErrors?) {
        
        guard  let readerItem = readers[reader] else {
            return (nil, LibraryErrors.intruder)
        }
        guard readerItem.debt == 0 else {
            return (nil, LibraryErrors.debtor)
        }
        guard books.contains(book) else {
            return (nil, LibraryErrors.noBook)
        }
        
        var newReader = readerItem
        newReader.debt += 1
        readers[reader] = newReader
        
        return ("(\(newReader.name) took the \(book) ", nil)
    }
}

let firstReader = LibraryOne()
firstReader.takeBook(reader: "Alice", book: "T")


////2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

class LibraryTwo {
    func takeBook(reader: String, book: String) throws -> String {
        
        guard  let readerItem = readers[reader] else {
            throw LibraryErrors.intruder
        }
        guard readerItem.debt == 0 else {
            throw  LibraryErrors.debtor
        }
        guard books.contains(book) else {
            throw  LibraryErrors.noBook
        }
        
        var newReader = readerItem
        newReader.debt += 1
        readers[reader] = newReader
        
        return "(\(newReader.name) took the \(book) "
    }
}


let secondReader = LibraryTwo()
do {
    let read = try secondReader.takeBook(reader: "Eve", book: "T")
} catch LibraryErrors.debtor {
    print("This is the debtor!")
} catch LibraryErrors.intruder {
    print("This is the intruder!")
} catch LibraryErrors.noBook {
    print("No this book!")
} catch let error {
    print(error.localizedDescription)
}

