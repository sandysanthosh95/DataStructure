import UIKit

class TreeNode<T> {
    var value: T
    var childer: [TreeNode<T>] = []

    init(_ value: T) {
        self.value = value
    }

    func addChild(_ child: TreeNode<T>) {
        childer.append(child)
    }
}


struct Queue<T> { // For Order travasel we using this
    var storage: [T] = []

    var isEmpty: Bool {
        return storage.isEmpty
    }

    mutating func enqueue(_ value: T) {
        storage.append(value)
    }

    mutating func dequeue() -> T? {
        isEmpty ? nil : storage.removeFirst()
    }
}


extension TreeNode where T: Equatable {
    func depthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        childer.forEach {$0.depthFirst(visit)}
    }

    func leverOrderTravasel(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        childer.forEach {
            queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.childer.forEach { queue.enqueue($0) }
        }
    }

    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        depthFirst { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

let bevarages = TreeNode<String>("Bevarages")

let hot = TreeNode<String>("Hot")
let tea = TreeNode<String>("tea")
let coffea = TreeNode<String>("Coffea")

hot.addChild(tea)
hot.addChild(coffea)

let cold = TreeNode<String>("Cold")
let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")

cold.addChild(soda)
cold.addChild(milk)



bevarages.addChild(hot)
bevarages.addChild(cold)

//bevarages.leverOrderTravasel { print($0.value) }



/*
       Bevarages
       /       \
      /         \
     Hot        Cold
     / \          / \
    /   \        /   \
   Tea Coffee  Soda  Milk

 */
 // This how the structure is happen from above lines




bevarages.search("Soda")?.value
