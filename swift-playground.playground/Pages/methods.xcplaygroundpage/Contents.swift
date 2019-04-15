//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Methods
 - Instance Methods
 - The self Property
 - Modifying Value Types from Within Instance Methods
 - #Type Methods
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/Methods.html
 */

/*
 Instance Methods
 */
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

// The self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"
// Modifying Value Types from Within Instance Methods
// Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var anotherPoint = AnotherPoint(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")
// Prints "The point is now at (3.0, 4.0)"
// Note that you cannot call a mutating method on a constant of structure type, because its properties cannot be changed
/*
 #Type Methods
 */
// You indicate type methods by writing the static keyword before the method’s func keyword. Classes may also use the class keyword to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
}
//: [Next](@next)
