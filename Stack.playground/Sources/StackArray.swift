import Foundation

public actor StackArray<T: Any>: Stack {
    public typealias Item = T
    private var array: [Item] = []
    
    public init() {}
    
    public func isEmpty() async -> Bool {
        array.isEmpty
    }
    
    public func pop() async -> Item? {
        guard !array.isEmpty else {
            return nil
        }
        return array.removeLast()
    }
    
    public func push(element: Item) async {
        array.append(element)
    }
}


public struct StackArrayStruct<T: Any>: StackStruct {
    public typealias Item = T
    private var array: [Item] = []
    
    public init() {}
    
    public func isEmpty() -> Bool {
        array.isEmpty
    }
    
    public mutating func pop() -> T? {
        guard !array.isEmpty else {
            return nil
        }
        return array.removeLast()
    }
    
    public mutating func push(element: T) {
        array.append(element)
    }
}
