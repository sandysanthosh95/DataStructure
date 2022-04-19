import UIKit

struct Queue<T> {
    var storage: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: T? {
        guard !isEmpty else {return nil}
        return storage.first
    }
    
    mutating func enqueue(_ value: T) {
        storage.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else {return nil}
        return storage.removeFirst()
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return "----top----\n" + storage.map { "\($0)" }.joined(separator: "\n") + "\n----bottom---"
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

print(queue)
queue.dequeue()
print(queue)
