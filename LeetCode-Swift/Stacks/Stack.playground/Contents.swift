// Stacks Used in iOS As Navigation Push-Pop & Memory Management

import Foundation
struct Stack<ItemOfStack> {
    var objects:[ItemOfStack] = []
    init() {}
}

// MARK:- For printing the Stack
extension Stack:CustomStringConvertible {
    var description: String {
        return """
    \(objects.map {"\($0)"}.reversed().joined(separator: "\n") )
    """
    }
}

// For push & Pop
// push and pop both have a O(1) time complexity.
extension Stack {
    
    public mutating func pushObject(objectToPush:ItemOfStack) {
        objects.append(objectToPush)
    }
    @discardableResult
    public mutating func popElement() ->ItemOfStack? {
        return objects.popLast()
    }
}
extension Stack {
    
    func peek()->ItemOfStack? {
        return objects.last
    }
    
    public var isEmpty:Bool {
        peek() == nil
    }
    // Adding objects as initilizers
    public init(_ elements:[ItemOfStack]) {
        self.objects = elements
    }
}
// To define
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: ItemOfStack...) {
        objects = elements
    }
}

//Print Stack in reverse Order
   // Time & space complexity O(n)
    func printInReverseOrder<T>(elements:[T]){
        var customStack = Stack<T>()
        
        for currentObject in elements {
            customStack.pushObject(objectToPush: currentObject)
        }
        while let currentObject = customStack.popElement() {
            print("Object In Reverse--->", currentObject)
        }
    
    }

// Check Paranthesis function...
// ()
func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    for character in string {
        if character == "(" {
            stack.pushObject(objectToPush: character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.popElement()
            }
        }
    }
    return stack.isEmpty
}

var books = Stack<String>()
books.pushObject(objectToPush: "Physics")
books.pushObject(objectToPush: "Math")
books.pushObject(objectToPush: "English")
books.description
books.popElement()
books.description

let arrayOfCars = ["Toyota","Honda","Skoda"]
let cars = Stack(arrayOfCars)
cars.description

var stackByArray:Stack = ["Janesh","Jhon"]

stackByArray.popElement()
stackByArray.description
print(stackByArray)
printInReverseOrder(elements: [1,2,3,4])
print("check paranthesis-----", checkParentheses("()"))
print("check paranthesis-----", checkParentheses("("))
print("check paranthesis-----", checkParentheses("())"))
