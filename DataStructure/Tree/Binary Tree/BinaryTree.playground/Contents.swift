import UIKit

class BinaryNode<T> {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T) {
        self.value = value
    }
}

/*
 
       10
      /  \
     /    \
    9     2
   /\     /\
  /  \   /  \
 1   3   4  6
 
 */ // Our problem

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two
nine.leftChild = one
nine.rightChild = three
two.leftChild = four
two.rightChild = six


// In Order Travasel:

/*
  Travese from last left node and parent then it will go to right
  output: 1 9 3 10 4 2 6
 */

extension BinaryNode {
    func inOrderTravasel(_ visit: (T) -> Void) {
        leftChild?.inOrderTravasel(visit)
        visit(value)
        rightChild?.inOrderTravasel(visit)
    }
}

// Eg output: In Order Travasel

print("---------In Order Travasel-----------")
ten.inOrderTravasel {
    print($0)
}
print("---------------------")


// Post Order Travasel:

/*
  Travese from last left node and then right then it go to parent  output: 1 3 9 4 6 2 10
 */


extension BinaryNode {
    func postOrderTravasel(_ visit: (T) -> Void) {
        leftChild?.postOrderTravasel(visit)
        rightChild?.postOrderTravasel(visit)
        visit(value)
    }
}

// Eg output: Post Order Travasel

print("---------Post Order Travasel-----------")
ten.postOrderTravasel {
    print($0)
}
print("---------------------")


// Pre Order Travasel:

/*
 Travese from root  then left node and then right  output: 10 9 1 3 2 4 6
 */


extension BinaryNode {
    func preOrderTravasel(_ visit: (T) -> Void) {
        visit(value)
        leftChild?.preOrderTravasel(visit)
        rightChild?.preOrderTravasel(visit)
    }
}

// Eg output: Pre Order Travasel

print("---------Pre Order Travasel-----------")
ten.preOrderTravasel {
    print($0)
}
print("---------------------")


