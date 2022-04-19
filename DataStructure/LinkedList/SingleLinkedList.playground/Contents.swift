import UIKit

class Node<Value: Equatable> {

    var value: Value
    var next: Node<Value>?

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}


struct LinkedList<Value: Equatable> {
    var head: Node<Value>?
    var tail: Node<Value>?

    var isEmpty: Bool {
        return head == nil
    }
    
    // Push
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    // pop
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail?.next = node
        tail = node

    }

    mutating func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head

        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }

    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }

    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    mutating func removeLast() -> Value? {
        guard let head = head else {return nil}
        guard head.next != nil else {
            return pop()
        }
        var prevNode = head
        var currentNode = head

        while let next = currentNode.next {
            prevNode = currentNode
            currentNode = next
        }
        prevNode.next = nil
        tail = prevNode
        return currentNode.value
    }

    mutating func remove(after node: Node<Value>) -> Value? {

        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head  else {
            return "Empty List"
        }
        return "\(head)"
    }

}



// Problems

// P01 (*) Find the last element of a linked list.

extension LinkedList {

    var last: Value? {
        guard let tail = tail else {
            return nil
        }
        return tail.value
    }
}

// P02 (*) Find the last but one element of a linked list.

extension LinkedList {

    var pennultimate: Value? {
        var prevNode = head
        var currentNode = head

        while let next = currentNode?.next {
            prevNode = currentNode
            currentNode = next
        }
        return prevNode?.value
    }
}


// P03 (*) Find the Kth element of a linked list.

extension LinkedList {

    subscript(index: Int) -> Value? {
        var currentIndex = 0
        var node = head

        while currentIndex != index {
            print(currentIndex, index)
            node = node?.next
            currentIndex += 1
        }
        return node?.value
    }


}

// P04 (*) Find the number of elements of a linked list.

extension LinkedList {
    var length: Int {

        guard let head = head else {
            return 0
        }
        var currentNode = 1
        var node = head

        while let next = node.next {
            node = next
            currentNode += 1
        }
        return currentNode
    }
}

// P05 (*) Reverse a linked list.

extension LinkedList {
    mutating func reverse() -> Node<Value>? {
        var previousNode: Node<Value>? = nil
        var currentNode = head
        var nextNode = currentNode?.next
        
        while nextNode != nil {
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        currentNode?.next = previousNode
        return currentNode
    }
}

extension LinkedList {
    mutating func detectLoop(_ node: Node<Value>?) -> Bool {
        var node: Node? = node
        var hash = [Value?]()
        while node != nil {
            if hash.contains(node?.value) {
                return true
            }
            hash.append(node?.value)
            node = node?.next
        }
        return false
    }
    
    func merge(_ list: LinkedList<Value>) -> Node<Value>? {
        tail?.next = list.head
        return head
    }
}

var list = LinkedList<Int>()

list.append(1)
list.append(2)
list.append(3)
list.append(4)

