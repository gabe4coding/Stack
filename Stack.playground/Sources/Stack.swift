import Foundation

public protocol Stack: AnyObject {
    associatedtype Item = Any
    func isEmpty() async -> Bool
    func pop() async ->  Item?
    func push(element: Item) async
}

public protocol StackStruct {
    associatedtype Item = Any
    func isEmpty() -> Bool
    mutating func pop() ->  Item?
    mutating func push(element: Item)
}

///Extensions
public extension Stack {
    func pushDouble(first: Item, second: Item) async {
        await push(element: first)
        await push(element: second)
    }
    
    func popDouble() async -> (Item?, Item?)  {
        (await pop(),await pop())
    }
}
