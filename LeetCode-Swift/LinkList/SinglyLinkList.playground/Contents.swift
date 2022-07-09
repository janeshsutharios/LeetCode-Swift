class Node<Element> {
    var value:Element
    var next:Node?
    init(value:Element, next:Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node:CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value)--->" + String(describing: next)
    }
}
let nodeData1 = Node(value: 1)
let nodeData2 = Node(value: 2)
let nodeData3 = Node(value: 3)
nodeData1.next = nodeData2
nodeData2.next = nodeData3
nodeData1


struct SingleLinkList<SElement> {
    var head:Node<SElement>?
    var tail:Node<SElement>?
    
    init() {
        
    }
    var isEmpty:Bool {
        return head == nil
    }
}

extension SingleLinkList :CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Link list is Empty"
        }
        return String(describing: head)
    }
}
// Adding Element at start of singly link list

extension SingleLinkList {
    
    mutating func addElementsAtFirstIndex(value:SElement) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
}

var ex1 = SingleLinkList<Int>()
ex1.addElementsAtFirstIndex(value: 1)
ex1.addElementsAtFirstIndex(value: 2)
ex1.addElementsAtFirstIndex(value: 3)
print(ex1.description)

// Adding Element at End of singly link list

extension SingleLinkList {
    
    mutating func addAtEnd(value:SElement) {
        let nodeToAdd = Node(value: value)
        if head == nil {
           addElementsAtFirstIndex(value: value)
        } else {
            tail?.next = nodeToAdd
            tail = tail?.next
        }
    }
}

var ex2 = SingleLinkList<Int>()
ex2.addAtEnd(value: 1)
ex2.addAtEnd(value: 2)
ex2.addAtEnd(value: 3)
print(ex2.description)

// MARK:- Adding node at particular index

extension SingleLinkList {
    
    func nodeAt(atIndex:Int) -> Node<SElement>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < atIndex {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    // Time complexity O(i)
    mutating func insertNodeAtIndex(indexValue:Int, itemToInsert:SElement) -> Node<SElement>? {
        let newNode = Node(value: itemToInsert)
        let prevNode = nodeAt(atIndex: indexValue-1)
        newNode.next = prevNode?.next
        prevNode?.next = newNode
        return newNode
    }
    
}
print(ex2.nodeAt(atIndex: 0)?.value)
print(ex2.nodeAt(atIndex: 1)?.value)
print(ex2.nodeAt(atIndex: 2)?.value)
print(ex2.nodeAt(atIndex: 3)?.value)
ex2.insertNodeAtIndex(indexValue: 1, itemToInsert: 10)
print(ex2.description)


// MARK:- POP Operations..

extension SingleLinkList {
    //O(1)
    mutating func removeAtFirst() ->SElement? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    var countOfNodes:Int {
        var currentNode = head
        if isEmpty {
            return 0
        }
        var count = 1
        while let isExist = currentNode?.next {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    // O(1)
    mutating func removeFromLast() {
        if countOfNodes == 1 {
            head = nil
            tail = nil
        } else {
            var prevNode = nodeAt(atIndex: countOfNodes-2)
            prevNode?.next = nil
            tail = prevNode
        }
    }
    // O(1)
    mutating func removeAfterNode(node:Node<SElement>) ->SElement? {
        defer {
            if node.next === tail {
                tail = node
            } else {
                node.next = node.next?.next
            }
        }
        return node.next?.value
    }
    
}
ex2.removeFromLast()
print(ex2.description)

//ex2.removeFromLast()
//print(ex2.description)
//
//ex2.removeFromLast()
//print(ex2.description)
//
//
//ex2.removeFromLast()
//print(ex2.description)

let index = 1
let node = ex2.nodeAt(atIndex: index - 1)!
let removedValue = ex2.removeAfterNode(node: node)
print("After removing at index \(index): \(ex2)")
print("Removed value: " + String(describing: removedValue))
