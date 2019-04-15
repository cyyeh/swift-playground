/*
 Referenced from Stanford CS193p

 #: important
 ##: very important

 The Basics
 - Constants and Variables
 - Comments
 - Semicolons
 - Integers
 - Floating-Point Numbers
 - #Type Safety and Type Inference
 - Numeric Literals
 - #Numeric Type Conversion
 - Type Aliases
 - Booleans
 - #Tuples
 - ##Optionals
 - Assertions and Preconditions

 Reference: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
 */

import Foundation

/*
 Constants and Variables
 */

// Declaring Constants and Variables
let thisIsConstant = 10
var thisIsVariable = 20

var x = 0, y = 2, z = 3

// Type Annotations
// only needed if the declared variable or constant doesn't have an initial value
var welcomeMessage: String = "hi"
//var red, green, blue: Double

// Naming Constants and Variables
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var a = 1
a = 2
let b = 2
// b = 3 compile-time error

// Printing Constants and Variables
print("hello world", terminator: "") // print without a line break
print("The current value of a is \(a)")

/*
 Comments
 */
// single-line comment
/*
 multi-line comment
 */
/*
 nested-multi-line comment
 /*
 nested-multi-line comment
 */
 */

/*
 Semicolons
 */
// only required if you want to write multiple separate statements on a single line
let cat = "cat"; print(cat)

/*
 Integers
 */
// Swift provides signed and unsigned integers in 8, 16, 32, 64 bit forms
let minUInt8Value = UInt8.min
let maxUInt8Value = UInt8.max
let minUInt64Value = UInt64.min
let maxUInt64Value = UInt64.max
let minInt8Value = Int8.min
let maxInt8Value = Int8.max
let minUInt32Value = UInt32.min
let maxUInt32Value = UInt32.max
let minInt32Value = Int32.min
let maxInt32Value = Int32.max
let minInt64Value = Int64.min
let maxInt64Value = Int64.max
// Int: the same size as the current platform's native word size
let minIntValue = Int.min
let maxIntValue = Int.max
// UInt: the same size as the current platform's native word size
let minUIntValue = UInt.min
let maxUIntValue = UInt.max

/*
 Floating-Point Numbers
 */
let maxDoubleValue: Double = 1.1 // 64-bit
let maxFloatValue: Float = 1.0  // 32-bit

/*
 #Type Safety and Type Inference
 */
let meaningOfLife = 42 // meaningOfLife is inferred to be of type Int
let pi = 3.14159 // pi is inferred to be of type Double
let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double

/*
 Numeric Literals
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

1.25e2  // 1.25 x 10^2
1.25e-2 // 1.25 x 10^(-2)
0xFp2 // 15 x 2^2
0xfP-2  // 15 x 2^(-2)
000123.456 // padded with extra zeros for easier reading
1_000_000 // underscore for easier reading

/*
 #Numeric Type Conversion
 */
// Integer Conversion
// let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
// let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pie = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int

/*
 Type Aliases
 */
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

/*
 Booleans
 */
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."

/*
 Tuples
 */
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"

/*
 ##Optionals
 */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

// nil
// You can’t use nil with non-optional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.
var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// If Statements and Forced Unwrapping
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."

// Optional Binding
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

// Implicitly Unwrapped Optionals
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

/*
 Assertions and Preconditions
 */
// You use assertions and preconditions to express the assumptions you make and the expectations you have while coding, so you can include them as part of your code. Assertions help you find mistakes and incorrect assumptions during development, and preconditions help you detect issues in production.

// Debugging with Assertions
// You pass this function an expression that evaluates to true or false and a message to display if the result of the condition is false
var age = -3
// assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >= 0.

age = 3
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// Enforcing Preconditions
// In the implementation of a subscript...
// precondition(index > 0, "Index must be greater than zero.")

//: [Next](@next)
