//: A UIKit based Playground for presenting user interface
  
import UIKit

struct Queue<T> {
    private var elements: [T]
    private var maxSize: UInt
    
    init(maxSize: UInt) {
        elements = []
        
        self.maxSize = maxSize
    }
    
    mutating func add(_ item: T) -> Bool {
        var result = false
        
        if elements.count < maxSize {
            elements.append(item)
            result = true
        }
        
        return result
    }
    
    mutating func remove() -> T? {
        var element: T? = nil
        
        if elements.count > 0 {
            element = elements.removeFirst()
        }
        
        return element
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    func isFull() -> Bool {
        return elements.count == maxSize
    }
    
    func isEmpty() -> Bool {
        return elements.count == 0
    }
}

var queue = Queue<Int>(maxSize: 2)
queue.add(1)
queue.add(2)
queue.add(3)
queue.isFull()
queue.isEmpty()

queue.remove()
queue.remove()
queue.remove()
queue.isFull()
queue.isEmpty()

queue.add(100)
queue.isFull()
queue.isEmpty()



extension Queue {
    func filter(predicate: (T) -> Bool) -> [T] {
        var result: [T] = []
        
        for item in elements {
            if predicate(item) {
                result.append(item)
            }
        }
        
        return result
    }
    
    mutating func map(transform: (T) -> T) -> Queue {
        var result: Queue = Queue<T>(maxSize: self.maxSize)
        
        for item in elements {
            let newElement = transform(item)
            result.add(newElement)
        }
        
        return result
    }
    
    mutating func sort(by: (T, T) -> Bool ) -> Queue {
        var result: Queue = Queue<T>(maxSize: self.maxSize)
        var sortedArray = elements
        sortedArray.sort(by: by)
        
        for item in sortedArray {
            result.add(item)
        }
        
        return result
    }
}

queue = Queue<Int>(maxSize: 10)
for i in 0..<10 { queue.add(i) }
let filtered = queue.filter() { $0 > 5 }
print("Filter: \(filtered)")

let mapped = queue.map() { $0 * $0 }
print("Map: \(mapped)")

let sorted = queue.sort() { $0 > $1 }
print("Sort: \(sorted)")



extension Queue {
    subscript (index: UInt) -> T? {
        var element: T? = nil
        
        if index < elements.count {
            element = elements[Int(index)]
        }
        
        return element
    }
}

queue[0]
queue[9]
queue[10]
