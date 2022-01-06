import UIKit
import XCTest

protocol Stack: AnyObject {
    associatedtype Item = Any
    func isEmpty() async -> Bool
    func pop() async ->  Item?
    func push(element: Item) async
}

///Array
actor StackArray<T: Any>: Stack {
    typealias Item = T
    private var array: [Item] = []
    
    func isEmpty() async -> Bool {
        array.isEmpty
    }
    
    func pop() async -> Item? {
        guard !array.isEmpty else {
            return nil
        }
        return array.removeLast()
    }
    
    func push(element: Item) async {
        array.append(element)
    }
}


///Linked List
actor StackLinkedList<T: Any>: Stack {
    typealias Item = T
    
    fileprivate var head: Node?
    private var tail: Node?

    class Node {
        var value: Item
        var next: Node?
        unowned var previous: Node?
        
        init(value: Item) {
            self.value = value
        }
    }
    
    func isEmpty() async -> Bool {
        head == nil
    }
    
    func pop() async -> Item? {
        if let tailNode = tail {
            return remove(node: tailNode)
        }
        if let headNode = head {
            return remove(node: headNode)
        }
        return nil
    }
    
    func push(element: Item) async {
        let newNode = Node(value: element)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    private func remove(node: Node) -> Item {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

///Extensions
extension Stack {
    func pushDouble(first: Item, second: Item) async {
        await push(element: first)
        await push(element: second)
    }
    
    func popDouble() async -> (Item?, Item?)  {
        (await pop(),await pop())
    }
}

///Usage
class StackTest: XCTestCase {
    func testArray() {
        measure {
            let stack = StackArray<String>()

            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.pushDouble(first: "First", second: "Second")
                await stack.isEmpty()
                await stack.popDouble()
                await stack.isEmpty()
                await stack.pop()
                
            }
        }
    }
    
    func testLinkedList() {
        measure {
            let stack = StackLinkedList<String>()

            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.pushDouble(first: "First", second: "Second")
                await stack.isEmpty()
                await stack.popDouble()
                await stack.isEmpty()
                await stack.pop()
                
            }
        }
    }
}

StackTest.defaultTestSuite.run()











