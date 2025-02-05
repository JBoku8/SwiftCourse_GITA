import UIKit

// TASK 1
protocol Shape {
    func area() -> Double
    var description: String { get }
}


struct Rectangle: Shape {
    let width: Double;
    let height: Double;
    
    func area() -> Double {
        return height * width;
    }
    
    var description: String {
        return "This is a Rectangle";
    }
}


struct Circle: Shape  {
    let radius: Double;
    
    func area() -> Double {
        return Double.pi * radius * radius;
    }
    
    var description: String {
        return "This is a Circle";
    }
}

let rectangle = Rectangle(width: 5, height: 10)
print(rectangle.area())
print(rectangle.description)


let circle = Circle(radius: 7)
print(circle.area())
print(circle.description)

let shapes: [Shape] = [rectangle, circle]
let totalArea = shapes.reduce(0) { $0 + $1.area() }
print("Total area: \(totalArea)")


// TASK 2
class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func greet() {
        print("Hi, I am \(name), I am \(age) year[s] old.")
    }
}

class Employee: Person {
    let jobTitle: String
    
    init(name: String, age: Int, jobTitle: String) {
        self.jobTitle = jobTitle;
        super.init(name: name, age: age)
    }
    
    override func greet() {
        print("Hi, I am \(name), a \(jobTitle), I am \(age) year[s] old.")
    }
}

let person = Person(name: "George", age: 25)
person.greet()

let employee = Employee(name: "Anna", age: 30, jobTitle: "Programmer")
employee.greet()



// TASK 3
protocol Appliance {
    var powerUsage: Double { get }
    func calculateMonthlyConsumption(hours: Double) -> Double
}

extension Appliance {
    var description: String {
        return "This appliance uses \(powerUsage) watts each month."
    }
    
    func calculateMonthlyConsumption(hours: Double) -> Double {
        return powerUsage * hours;
    }
}

struct WashingMachine: Appliance {
    let powerUsage: Double = 500 // watt
}

struct Refrigerator: Appliance {
    let powerUsage: Double = 100 // watt
}

let washingMachine = WashingMachine()
print(washingMachine.description)
print(washingMachine.calculateMonthlyConsumption(hours: 30))

let refrigerator = Refrigerator()
print(refrigerator.description)
print(refrigerator.calculateMonthlyConsumption(hours: 720))



// TASK 4
struct Book {
    let title: String
    let author: String
}

protocol Borrowable {
    func borrow()
    func returnBook()
}

class Library: Borrowable {
    private var books: [Book]
    private var booksBorrowed: [Book]
    
    
    init() {
        self.books = []
        self.booksBorrowed = []
    }
    
    func addBook(_ book: Book) {
        self.books.append(book)
    }
    
    func removeBook(_ book: Book) {
        self.books.removeAll { $0.title == book.title && $0.author == book.author }
    }
    
    func borrow() {
        if let book = books.first {
            print("Borrowed \(book.title)")
            books.removeFirst()
            booksBorrowed.append(book)
        }
    }
    
    func returnBook() {
        if let borrowed = booksBorrowed.last {
            print("Book Returned \(borrowed.title)")
            booksBorrowed.removeLast()
            books.append(borrowed)
        }
    }
}

extension Library {
    func listBooks(){
        for (index, book) in books.enumerated() {
            print("\(index + 1). \(book.title) by \(book.author)")
        }
    }
    
    func listBorrowedBooks(){
        for (index, book) in booksBorrowed.enumerated() {
            print("\(index + 1). \(book.title) by \(book.author)")
        }
    }
}

var library = Library()
library.addBook(Book(title: "1984", author: "George Orwell"))
library.addBook(Book(title: "To Kill a Mockingbird", author: "Harper Lee"))

library.listBooks()
library.borrow()
library.listBooks()
library.listBorrowedBooks()


// TASK 5
class Vehicle {
    var make: String
    var model: String
    var fuelEfficiency: Double
    
    init(make: String, model: String, fuelEfficiency: Double) {
        self.make = make
        self.model = model
        self.fuelEfficiency = fuelEfficiency
    }
    
    func calculateFuelNeeded(for distance: Double) -> Double {
        distance / fuelEfficiency;
    }
}

extension Vehicle {
    func description() -> String {
        return "\(model) \(make)"
    }
}


class ElectricCar: Vehicle {
    var batteryCapacity: Double;
    let efficiency: Double = 5.0  // km per kWh
    
    init(make: String, model: String, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity;
        super.init(make: make, model: model, fuelEfficiency: 0.0)
    }
    
    override func calculateFuelNeeded(for distance: Double) -> Double {
        distance / efficiency
    }
}


let regularCar = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15)
print("Regular car:", regularCar.description())
print("Fuel needed for 150km:", regularCar.calculateFuelNeeded(for: 150), "liters")

let electricCar = ElectricCar(make: "Tesla", model: "Model 3", batteryCapacity: 50)
print("Electric car:", electricCar.description())
print("Energy needed for 150km:", electricCar.calculateFuelNeeded(for: 150), "kWh")
