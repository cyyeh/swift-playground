//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 Strings and Characters
 - String Literals
 - Initializing an Empty String
 - String Mutability
 - Strings Are Value Types
 - Working with Characters
 - Concatenating Strings and Characters
 - String Interpolation
 - Unicode
 - #Counting Characters
 - ##Accessing and Modifying a String
 - #Substrings
 - Comparing Strings
 - Unicode Representations of Strings
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
 */

/*
 String Literals
 */
let someString = "Some string literal value"

// Multiline String Literals
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// Special Characters in String Literals
/*
 The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
 An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number
 */

/*
 Initializing an Empty String
 */
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"
/*
 String Mutability
 */
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"
let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

/*
 Strings Are Value Types
 */
// If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable.
/*
 Working with Characters
 */
for character in "Dog!🐶" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"
/*
 Concatenating Strings and Characters
 */
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"
/*
 String Interpolation
 */
let multiplier = 3
let message = "\(multiplier + 2) times 2.5 is \(Double(multiplier + 2) * 2.5)"
// message is "3 times 2.5 is 7.5"
/*
 Unicode
 */
// Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page
/*
 #Counting Characters
 */
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"
/*
 ##Accessing and Modifying a String
 */
// String Indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
// Inserting and Removing
var welcomeMessage = "hello"
welcomeMessage.insert("!", at: welcomeMessage.endIndex)
// welcome now equals "hello!"
welcomeMessage.insert(contentsOf: " there", at: welcomeMessage.index(before: welcomeMessage.endIndex))
// welcome now equals "hello there!"
welcomeMessage.remove(at: welcomeMessage.index(before: welcomeMessage.endIndex))
// welcome now equals "hello there"
let range = welcomeMessage.index(welcomeMessage.endIndex, offsetBy: -6)..<welcomeMessage.endIndex
welcomeMessage.removeSubrange(range)
// welcome now equals "hello"
/*
 #Substrings
 */
let greetingMessage = "Hello, world!"
let i = greetingMessage.firstIndex(of: ",") ?? greetingMessage.endIndex
let beginning = greetingMessage[..<i]
// beginning is "Hello"
// Convert the result to a String for long-term storage.
let newString = String(beginning)

/*
 Comparing Strings
 */
// String and Character Equality
let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
// Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
/*
 Unicode Representations of Strings
 */
let dogString = "Dog‼🐶"

// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "
// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "
// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print(scalar)
    print("\(scalar.value) ", terminator: "")
}
print("")
//: [Next](@next)
