import UIKit
import XCTest

///Execution
class StackTest: XCTestCase {
    
    func testMemoryAllocationArray() {
        measure {
            _ = StackArray<String>()
        }
    }
    
    func testMemoryAllocationLinkedList() {
        measure {
            _ = StackLinkedList<String>()
        }
    }
    
    func testArrayActorPerformance() {
        let stack = StackArray<String>()
        measure {
            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.push(element: "Second")
                await stack.push(element: "Third")
                await stack.isEmpty()
                await stack.isEmpty()
                await stack.pop()
            }
        }
    }
    
    func testArrayStructPerformance() {
        var stack = StackArrayStruct<String>()
        measure {
            stack.push(element: "Third")
            stack.pop()
            stack.pop()
            stack.isEmpty()
            stack.push(element: "Second")
            stack.push(element: "Third")
            stack.isEmpty()
            stack.isEmpty()
            stack.pop()
        }
    }
    
    func testLinkedListActorPerformance() {
        let stack = StackLinkedList<String>()
        measure {
            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.push(element: "Second")
                await stack.push(element: "Third")
                await stack.isEmpty()
                await stack.pop()
            }
        }
    }
    
    func testLinkedListStructPerformance() {
        var stack = StackLinkedListStruct<String>()
        measure {
            stack.push(element: "Third")
            stack.pop()
            stack.pop()
            stack.isEmpty()
            stack.push(element: "Second")
            stack.push(element: "Third")
            stack.isEmpty()
            stack.pop()
        }
    }
    
    func testArrayActorCPU() {
        let stack = StackArray<String>()
        measure(metrics: [XCTCPUMetric()]) {
            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.push(element: "Second")
                await stack.push(element: "Third")
                await stack.isEmpty()
                await stack.pop()
            }
        }
    }
    
    func testLinkedListActorCPU() {
        let stack = StackLinkedList<String>()
        measure(metrics: [XCTCPUMetric()]) {
            Task {
                await stack.push(element: "Third")
                await stack.pop()
                await stack.pop()
                await stack.isEmpty()
                await stack.push(element: "Second")
                await stack.push(element: "Third")
                await stack.isEmpty()
                await stack.pop()
            }
        }
    }
    
    func testArrayStructCPU() {
        var stack = StackArrayStruct<String>()
        measure(metrics: [XCTCPUMetric()]) {
            stack.push(element: "Third")
            stack.pop()
            stack.pop()
            stack.isEmpty()
            stack.push(element: "Second")
            stack.push(element: "Third")
            stack.isEmpty()
            stack.pop()
        }
    }
    
    func testLinkedListStructCPU() {
        var stack = StackLinkedListStruct<String>()
        measure(metrics: [XCTCPUMetric()]) {
            stack.push(element: "Third")
            stack.pop()
            stack.pop()
            stack.isEmpty()
            stack.push(element: "Second")
            stack.push(element: "Third")
            stack.isEmpty()
            stack.pop()
        }
    }
}

StackTest.defaultTestSuite.run()











