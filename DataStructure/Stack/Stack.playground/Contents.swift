import UIKit


// LIFO - Last in first out



struct Stack<T> {
    var storage: [T] = []

    init() {}

    mutating func append(_ value: T) {
        storage.append(value)
    }

    mutating func pop() -> T? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let top = "-------top-----\n"
        let bottom = "\n-------bottom-----"
        return top + storage.map { "\($0)" }.reversed().joined(separator: "\n") + bottom // reversing array because the pop order should be reverse of array
    }
}

var stack = Stack<Int>()

stack.append(1)
stack.append(2)
stack.append(3)

print(stack)

//stack.pop()
//print(stack)

