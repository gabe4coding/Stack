import Foundation

///Linked List
public actor StackLinkedList<T: Any>: Stack {
    public typealias Item = T
    
    fileprivate var head: Node?
    private var tail: Node?
    
    public init() {}

    class Node {
        var value: Item
        var next: Node?
        unowned var previous: Node?
        
        init(value: Item) {
            self.value = value
        }
    }
    
    public func isEmpty() async -> Bool {
        head == nil
    }
    
    public func pop() async -> Item? {
        if let tailNode = tail {
            return remove(node: tailNode)
        }
        if let headNode = head {
            return remove(node: headNode)
        }
        return nil
    }
    
    public func push(element: Item) async {
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


public struct StackLinkedListStruct<T: Any> {
    public typealias Item = T
    
    fileprivate var head: Node?
    private var tail: Node?
    
    public init() {}

    class Node {
        var value: Item
        var next: Node?
        unowned var previous: Node?
        
        init(value: Item) {
            self.value = value
        }
    }
    
    public func isEmpty() -> Bool {
        head == nil
    }
    
    public mutating func pop() -> Item? {
        if let tailNode = tail {
            return remove(node: tailNode)
        }
        if let headNode = head {
            return remove(node: headNode)
        }
        return nil
    }
    
    public mutating func push(element: Item) {
        let newNode = Node(value: element)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    private mutating func remove(node: Node) -> Item {
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
