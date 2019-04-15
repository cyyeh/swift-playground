//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Inheritance
 - Defining a Base Class
 - Subclassing
 - Overriding
 - Accessing Superclass Methods, Properties, and Subscripts
 - #Overriding Methods
 - Preventing Overrides
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html
 */

/*
 Defining a Base Class
 */
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour
/*
 Subclassing
 */
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour
/*
 Overriding
 */
// Accessing Superclass Methods, Properties, and Subscripts
/*
 An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.
 An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
 An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.
 */

/*
 #Overriding Methods
 */
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
// Prints "Choo Choo"
/*
 Preventing Overrides
 */
// You can prevent a method, property, or subscript from being overridden by marking it as final. Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript)

//: [Next](@next)
