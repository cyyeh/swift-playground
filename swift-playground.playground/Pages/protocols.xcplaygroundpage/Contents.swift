//: [Previous](@previous)
/*
 Referenced from Stanford CS193p
 
 #: important
 ##: very important
 
 ##Protocols
 - Protocol Syntax
 - Property Requirements
 - Method Requirements
 - Mutating Method Requirements
 - Initializer Requirements
 - Protocols as Types
 - Delegation
 - Adding Protocol Conformance with an Extension
 - Collections of Protocol Types
 - Protocol Inheritance
 - Class-Only Protocols
 - Protocol Composition
 - Protocol Extensions
 
 Reference: https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
 */

/*
 Protocol Syntax
 */
protocol SomeProtocol {
    // protocol definition goes here
}

/*
 struct SomeStructure: FirstProtocol, AnotherProtocol {
 // structure definition goes here
 }
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
 // class definition goes here
 }
 */

/*
 Property Requirements
 */
protocol AnotherProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol2 {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName is "USS Enterprise"
/*
 Method Requirements
 */
protocol SomeProtocol3 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

/*
 Mutating Method Requirements
 */
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on
/*
 Initializer Requirements
 */
protocol SomeProtocol4 {
    init()
}

// Class Implementations of Protocol Initializer Requirements
class SomeClass: SomeProtocol4 {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol4 {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}


/*
 Protocols as Types
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
 var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
 for _ in 1...5 {
 print("Random dice roll is \(d6.roll())")
 }
 */
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4
/*
 Delegation
 */


/*
 Adding Protocol Conformance with an Extension
 */


/*
 Collections of Protocol Types
 */


/*
 Protocol Inheritance
 */


/*
 Class-Only Protocols
 */


/*
 Protocol Composition
 */


/*
 Protocol Extensions
 */
//: [Next](@next)
