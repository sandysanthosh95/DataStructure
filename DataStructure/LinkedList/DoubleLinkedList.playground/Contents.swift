import UIKit

class Node<T> {
    var value: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(value: T, next: Node<T>? = nil, prev: Node<T>? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "[ "
        if let prev = prev {
            text += "\(prev.value), "
        }
        text += "\(value)"
        
        if let next = next {
            text += ",\(next.value)"
        }
        
        text += " ]"
        
        return text
    }
}

struct DoubleLinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
}

extension DoubleLinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil { text += "," }
        }
        return text + "]"
    }
}


extension DoubleLinkedList {
    
    mutating func push(_ value: T) {
        let node = Node(value: value, next: head, prev: nil)
        head?.prev = node
        head = node
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value, next: nil, prev: tail)
        tail?.next = node
        tail = node
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        defer {
            let next = head?.next
            next?.prev = nil
            head = next
        }
        return head?.value
    }
    
    mutating func removeLast() -> T? {
        guard !isEmpty else {
            return nil
        }
        guard head?.next != nil else {
            return pop()
        }
        defer {
            let tailPrev = tail?.prev
            tailPrev?.next = nil
            tail = tailPrev
        }
        
        return tail?.value
    }
    
    func node(at Index: Int) -> Node<T>? {
        guard !isEmpty else {
            return nil
        }
        
        var currentIndex = 0
        var currentNode = head
        
        while currentIndex != Index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func remove(at after: Node<T>) {
        guard !isEmpty else {
            return
        }
        after.next = after.next?.next
        after.next?.next?.prev = after
    }
    
    mutating func insert(_ value: T, after node: Node<T>) {
        guard node.next != nil else {
            push(value)
            return
        }
        let myNode = Node(value: value, next: node.next?.next, prev: node)
        node.next = myNode
    }
    
    var length: Int {
        var currentIndex = 1
        var currentNode = head
        while let next = currentNode?.next {
            currentNode = next
            currentIndex += 1
        }
        return currentIndex
    }
    
    func reverse() -> Node<T>? {
        var previousNode: Node<T>? = nil
        var currentNode = head
        var nextNode = currentNode?.next
        
        while nextNode != nil {
            currentNode?.next = previousNode
            currentNode?.prev = nextNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        currentNode?.next = previousNode
        currentNode?.prev = nil
        return currentNode
    }

}

var array = DoubleLinkedList<Int>()

array.push(4)
array.push(3)
array.push(2)
array.push(1)

array.reverse()
