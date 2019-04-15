//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Basic Operators
 - Terminology
 - Assignment Operator
 - Arithmetic Operators
 - Compound Assignment Operators
 - Comparison Operators
 - Ternary Conditional Operator
 - #Nil-Coalescing Operator
 - #Range Operators
 - Logical Operators
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html
 */

/*
 Terminology
 */
// Unary operators ex: -a
// Binary operators ex: 2 + 3
// Ternary Operators ex: a ? b : c
// The values that operators affect are operands
/*
 Assignment Operator
 */
let b = 10
var a = 5
a = b
// a is now equal to 10
/*
 Arithmetic Operators
 */
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
10.0 / 4 // 2.5
10 / 3 // 3
10 / 4 // 2
// the Swift arithmetic operators don’t allow values to overflow by default. You can opt in to value overflow behavior by using Swift’s overflow operators (such as a &+ b)
"hello, " + "world"  // equals "hello, world"
// Remainder Operator
9 % 4
9 % -4
-9 % 4
// a % b and a % -b always give the same answer.
// Unary Minus Operator
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
/*
 Compound Assignment Operators
 */
var A = 1
A += 2
// a is now equal to 3
/*
 Comparison Operators
 */
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
/*
 Ternary Conditional Operator (a ? b : c)
 */
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
// Avoid combining multiple instances of the ternary conditional operator into one compound statement.
/*
 #Nil-Coalescing Operator (a ?? b)
 */
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
/*
 #Range Operators
 */
// Closed Range Operator
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
for name in names[2...] {
    print(name)
}
// Brian
// Jack
for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
/*
 Logical Operators
 */
// Logical NOT Operator (!)
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// Logical AND Operator (&&)
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
// Logical OR Operator (||)
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
// Combining Logical Operators with Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//: [Next](@next)
