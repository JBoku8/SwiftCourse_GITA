import UIKit

/**
HomeWork v2
*/

// TASK 1
func factorial(n: Int?) -> Int? {
    guard let fN = n else {
        return nil;
    }
    
    if fN < 0 {
        print("Invalid Input")
        return nil;
    }
    
    if fN == 0 || fN == 1 {
        return 1;
    }
    
    if let prevF = factorial(n: fN - 1) {
        return fN * prevF;
    }
    
    return nil
}


//print(factorial(n: 5) ?? "")    // Optional(120)
//print(factorial(n: 0) ?? "")    // Optional(1)
//print(factorial(n: -1) ?? "")   // nil (and prints "Invalid Input")
//print(factorial(n: nil) ?? "")  // nil


// TASK 2

struct Student {
   var name: String
   var grades: [Double]
}


let students = [
    "Alice" : Student(name: "Alice", grades: [5.5, 3.5, 5.75]),
    "Bob" : Student(name: "Bob", grades: [5.25, 3.75, 5.75]),
    "James": Student(name: "James", grades: [6.0, 4.0, 5.5])
]

func averageGrade(for student: Student, inClass students: [String: Student]) -> Double {
    
    for (_, classmate) in students {
        if classmate.name == student.name {
            let sum = classmate.grades.reduce(0.0, +)
            return classmate.grades.isEmpty ? 0.0 : sum / Double(classmate.grades.count)
        }
    }
    
    return 0.0;
}

func bestStudent(for student: Student, inClass students: [String: Student]) -> (Student, Double){
    var highestAverage = averageGrade(for: student, inClass: students)
    var bestStudent = student
    
    for (_, classmate) in students {
        let classmateAverage = averageGrade(for: classmate, inClass: students)
        if classmateAverage > highestAverage {
            highestAverage = classmateAverage
            bestStudent = classmate
        }
    }
        
    return (bestStudent, highestAverage)
}

let alice = students["Alice"]!
//print("Alice's average: \(averageGrade(for: alice, inClass: students).rounded())")

let (best, bestAverage) = bestStudent(for: alice, inClass: students)
//print("Best student: \(best.name) with average: \(bestAverage.rounded())")


// TASK 3

func findLongestWord(in words: [String?]) -> String? {
    var trueWords: [String] = []
    
    for word in words {
        if let defined = word {
            trueWords.append(defined)
        }
    }
    
    if(trueWords.isEmpty) {
        return nil
    }
    
    
    
    var result = trueWords[0]
    for word in trueWords {
        if word.count > result.count {
            result = word
        }
    }
    
    return result;
}

let test1 = ["hello", "world", "swift", "programming", nil, "code"]
let test2 = ["a", nil, "abc", "ab"]
print(findLongestWord(in: test1) ?? "")
print(findLongestWord(in: test2) ?? "")

// TASK 4

struct ShoppingItem {
    let name: String
    let quantity: Int
    var isPurchased: Bool = false // Default to false when created
}

struct ShoppingList {
    private var items: [String: ShoppingItem] = [:]
    
    mutating func addItem(name: String, quantity: Int) {
        items[name] = ShoppingItem(name: name, quantity: quantity);
    }
    
    mutating func markAsPurchased(item: ShoppingItem) {
        var updatedItem = item
        updatedItem.isPurchased = true;
        items[item.name] = updatedItem;
    }
    
    mutating func markAsPurchased(name: String) {
        if var updatedItem = items[name] {
            updatedItem.isPurchased = true;
            items[name] = updatedItem;
        }
    }
    
    func listUnpurchasedItems() -> [ShoppingItem] {
        return items.values.filter({!$0.isPurchased})
    }
    
    func listPurchasedItems() -> [ShoppingItem] {
        return items.values.filter({$0.isPurchased})
    }
}

var shoppingList = ShoppingList()
shoppingList.addItem(name: "Apples", quantity: 5)
shoppingList.addItem(name: "Bananas", quantity: 3)
shoppingList.markAsPurchased(name: "Apples")


let unpurchased = shoppingList.listUnpurchasedItems()
let purchased = shoppingList.listPurchasedItems()
print(unpurchased.map { "\($0.name): \($0.quantity)" })
print(purchased.map { "\($0.name): \($0.quantity)" })
