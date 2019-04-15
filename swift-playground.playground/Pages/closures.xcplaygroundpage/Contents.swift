//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Closures
 - #Closure Expressions
 - Trailing Closures
 - ##Capturng Values
 - ##Closures Are Reference Types
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/Closures.html
 */

/*
 #Closure Expressions
 */
// The Sorted Method
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// Closure Expression Syntax
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring Type From Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

// Operator Methods
reversedNames = names.sorted(by: >)

/*
 Trailing Closures
 */
reversedNames = names.sorted() { $0 > $1 }

// If a closure expression is provided as the function or method’s only argument and you provide that expression as a trailing closure, you do not need to write a pair of parentheses () after the function or method’s name when you call the function
reversedNames = names.sorted { $0 > $1 }

/*
 ##Capturing Values
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

/*
 ##Closures Are Reference Types
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
//: [Next](@next)
