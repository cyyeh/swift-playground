//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Classes and Structures
 - Comparing Classes and Structures
 - #Structures and Enumerations Are Value Types (ignore enumerations)
 - Classes Are Reference Types
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
 */

/*
 Comparing Classes and Structures
 */
/*
 Structures and classes in Swift have many things in common. Both can:
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to their values using subscript syntax
 Define initializers to set up their initial state
 Be extended to expand their functionality beyond a default implementation
 Conform to protocols to provide standard functionality of a certain kind
 Classes have additional capabilities that structures don’t have:
 Inheritance enables one class to inherit the characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Reference counting allows more than one reference to a class instance.
 */

// Definition Syntax
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Structure and Class Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties
print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"
// Memberwise Initializers for Structure Types
// All structures have an automatically generated memberwise initializer, which you can use to initialize the member properties of new structure instances.
let vga = Resolution(width: 640, height: 480)
// Unlike structures, class instances don’t receive a default memberwise initializer.
/*
 #Structures and Enumerations Are Value Types (ignore enumerations)
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"
/*
 Classes Are Reference Types
 */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//: [Next](@next)
