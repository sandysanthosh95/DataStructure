import UIKit


class BinaryNode<T> {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    var description: String {
        var s = ""
        if let left = leftChild {
            s += "(left: \(left.description)) <- "
        }
        s += "value: \(value)"
        if let right = rightChild {
            s += " -> (right: \(right.description))"
        }
        return s
    }
}

struct BinarySeachTree<T> where T: Comparable {
    var root: BinaryNode<T>?
    
    mutating func insert(_ value: T) {
        root = insert(for: root, value: value)
    }
    
    private func insert(for node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        guard let node = node else {
            return BinaryNode(value)
        }
        if value < node.value {
            node.leftChild = insert(for: node.leftChild, value: value)
        } else {
            node.rightChild = insert(for: node.rightChild, value: value)
        }
        return node
    }
    
    func contains(_ value: T) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            
            if node.value > value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    mutating func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        guard let node = node else {
            return nil
        }
        
        if node.value == value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
        } else if node.value > value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySeachTree: CustomStringConvertible {
    var description: String {
        guard let root = root else {
            return "Empty tree"
        }
        return String(describing: root.description)
    }
}


var bst = BinarySeachTree<Int>()
bst.insert(1)
bst.insert(0)
bst.insert(2)
bst.insert(3)
bst.insert(5)
bst.insert(4)


/*
      1
    /  \
   0    2
         \
          3
           \
            5
           /
          4
 */


print(bst)
print(bst.contains(1))
