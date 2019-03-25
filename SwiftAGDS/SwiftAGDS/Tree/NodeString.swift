//
//  NodeString.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-22.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


class NodeString {
    var value: String
    var left : NodeString?
    var right : NodeString?
    
    init(_ value: String,_ left: NodeString?,_ right: NodeString?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class BinaryTreeString {
    var root: NodeString?
    
    func add(value: String){
        root = addRecursive(currentNode: self.root, value: value)
    }
    
    func addRecursive(currentNode: NodeString?, value: String) -> NodeString {
        guard let currentNode = currentNode else { return NodeString.init(value, nil, nil) }
        
        if value < currentNode.value {
            currentNode.left = addRecursive(currentNode: currentNode.left, value: value)
        }else if value > currentNode.value  {
            currentNode.right = addRecursive(currentNode: currentNode.right, value: value)
        }
        return currentNode
    }
    
    
    func traverseInOrder(currentNode: NodeString?) {
        guard let currentNode = currentNode
            else { return }
        traverseInOrder(currentNode: currentNode.left)
        print(currentNode.value)
        traverseInOrder(currentNode: currentNode.right)
    }
    
    func traversePreOrder(currentNode: NodeString?) {
        guard let currentNode = currentNode
            else { return }
        print(currentNode.value)
        traversePreOrder(currentNode: currentNode.left)
        traversePreOrder(currentNode: currentNode.right)
    }
    
    func traversePostOrder(currentNode: NodeString?) {
        guard let currentNode = currentNode
            else { return }
        traversePostOrder(currentNode: currentNode.left)
        traversePostOrder(currentNode: currentNode.right)
        print(currentNode.value)
    }
    
    
    
    // getting the node by value
    func getNode(currentNode: NodeString?, _ value: String ) -> NodeString? {
        if let currentNode = currentNode {
            // not nil
            if currentNode.value == value {
                return currentNode
            } else if let newnode = getNode(currentNode: currentNode.left, value){
                if newnode.value == value {
                        return newnode
                }
            } else if let newnode = getNode(currentNode: currentNode.right, value) {
                if newnode.value == value {
                    return newnode
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
        return nil
    }
}

//
//var left = getNode(currentNode: currentNode.left, value)
//var right = getNode(currentNode: currentNode.right, value)
//
//if left?.value == value{
//    return left
//}else if right?.value == value {
//    return right
//}else {
//    return nil
//}
