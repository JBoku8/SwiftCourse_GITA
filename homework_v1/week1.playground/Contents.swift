import UIKit

print("Solution 1: for in loop")
for number in 1...10 {
    let type = number % 2 == 0 ? "Even" : "Odd"
    print("\(number) \(type)")
}

// Solution 2: while loop
print("\nSolution 2: while loop")
var counter = 1
while counter <= 10 {
    let type = counter % 2 == 0 ? "Even" : "Odd"
    print("\(counter) \(type)")
    counter += 1
}

// Solution 3: repeat while loop
print("\nSolution 3: repeat while loop")
var count = 1
repeat {
    let type = count % 2 == 0 ? "Even" : "Odd"
    print("\(count) \(type)")
    count += 1
} while count <= 10



var tvSeries = ["Breaking Bad", "Game of Thrones", "Friends", "The Office",
                "Stranger Things", "The Crown", "Black Mirror", "The Mandalorian",
                "Westworld", "The Witcher"]

for (index, series) in tvSeries.enumerated() {
    if index % 3 == 0 {
        print("\(index): \(series.uppercased())")
    } else if index % 4 == 0 {
        let capitalizedWords = series.split(separator: " ")
            .map { $0.capitalized }
            .joined(separator: " ")
        print("\(index): \(capitalizedWords)")
    } else {
        print("\(index): \(series)")
    }
}

// Adding new item
tvSeries.append("The Last of Us")
print("\nUpdated list:")
tvSeries.forEach { print($0) }



// Dictionary implementation
var grades = ["Alice": 85, "Bob": 90, "Charlie": 78]

// 1. Print all students and grades
print("All students and grades:")
for (student, grade) in grades {
    print("\(student): \(grade)")
}

// 2. Add new student
grades["David"] = 95
print("\nAfter adding new student:")
for (student, grade) in grades {
    print("\(student): \(grade)")
}

// 3. Find specific student's grade
let studentName = "Alice"
if let grade = grades[studentName] {
    print("\n\(studentName)'s grade: \(grade)")
}

// Array and Tuple implementation
var gradesArray: [(name: String, grade: Int)] = [
    (name: "Alice", grade: 85),
    (name: "Bob", grade: 90),
    (name: "Charlie", grade: 78)
]

print("\nUsing Array of Tuples:")
gradesArray.forEach { print("\($0.name): \($0.grade)") }



// Define the tuple
var person = (name: "John Smith", age: 30, city: "New York")

// Print each property
print("Name: \(person.name)")
print("Age: \(person.age)")
print("City: \(person.city)")

// Update city
person.city = "San Francisco"
print("\nAfter updating city:")
print("Name: \(person.name)")
print("Age: \(person.age)")
print("City: \(person.city)")



// Create constant array of shopping items with prices
let shoppingList: [(item: String, price: Double)] = [
    (item: "Milk", price: 3.99),
    (item: "Bread", price: 2.49),
    (item: "Cheese", price: 5.99),
    (item: "Apples", price: 4.99),
    (item: "Bananas", price: 2.99)
]

// Print all items
print("Shopping List:")
for item in shoppingList {
    print("\(item.item): $\(item.price)")
}

// Calculate total cost
var totalCost = 0.0
for item in shoppingList {
    totalCost += item.price
}

print("\nTotal cost: $\(String(format: "%.2f", totalCost))")
