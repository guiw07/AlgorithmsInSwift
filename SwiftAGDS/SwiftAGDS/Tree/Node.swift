//
//  Node.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-22.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//



import Foundation


class Node {
    var value: Int
    var left : Node?
    var right : Node?
    
    init(_ value: Int,_ left: Node?,_ right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class BinaryTree {
    var root: Node?
    
    func add(value: Int){
        root = addRecursive(currentNode: self.root, value: value)
    }
    
    
    func addRecursive(currentNode: Node?, value: Int) -> Node {
        guard let currentNode = currentNode else { return Node.init(value, nil, nil) }
        
        if value < currentNode.value {
            currentNode.left = addRecursive(currentNode: currentNode.left, value: value)
        }else if value > currentNode.value  {
            currentNode.right = addRecursive(currentNode: currentNode.right, value: value)
        }
        return currentNode
    }
    
    
    func traverseInOrder(currentNode: Node?) {
        guard let currentNode = currentNode
            else { return }
        traverseInOrder(currentNode: currentNode.left)
        print(currentNode.value)
        traverseInOrder(currentNode: currentNode.right)
    }
    
    func traversePreOrder(currentNode: Node?) {
        guard let currentNode = currentNode
            else { return }
        print(currentNode.value)
        traversePreOrder(currentNode: currentNode.left)
        traversePreOrder(currentNode: currentNode.right)
    }
    
    func traversePostOrder(currentNode: Node?) {
        guard let currentNode = currentNode
            else { return }
        traversePostOrder(currentNode: currentNode.left)
        traversePostOrder(currentNode: currentNode.right)
        print(currentNode.value)
    }
    
}
