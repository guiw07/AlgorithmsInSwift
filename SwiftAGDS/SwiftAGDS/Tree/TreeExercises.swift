//
//  TreeExercices.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-26.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

/*
 In Main we just need to call
 
 Exercise 1
 listAllParentsOfNodes()
 
 Exercise 2
 AdjacencyListWeightedForTree()

 */


import Foundation

class NodeArray {
    var value: Int
    var children: [NodeArray]
    var parent: NodeArray?
    init(_ value: Int,_ parent: NodeArray?) {
        self.value = value
        self.parent = parent
        self.children = [NodeArray]()
    }
}

class Tree {
    var root: NodeArray?
    
    func add(value: Int,parentValue: Int = -1){
        if root != nil {
            let parentNode = getNode(currentNode: root, parentValue)
            parentNode!.children.append(NodeArray.init(value,parentNode))
        } else{
            root = NodeArray.init(value, nil)
        }
    }

    func getNode(currentNode: NodeArray?, _ value: Int ) -> NodeArray? {
        if let currentNode = currentNode {
            // not nil
            if currentNode.value == value {
                return currentNode
            }else{
                for n in currentNode.children {
                    if let newnode = getNode(currentNode: n, value){
                        if newnode.value == value {
                            return newnode
                        }
                    }
                }
            }
        }
        return nil
    }
    
    func getParent(_ value: Int) -> NodeArray?{
        let parentNode = getNode(currentNode: root, value)
        return parentNode!.parent
    }
    
    func getListOfAncestors(_ value: Int, _ parentsList: inout [Int]){
        let parentNode = getNode(currentNode: root, value)
        if parentNode!.parent != nil {
            parentsList.append(parentNode!.value)
            let newvalue = parentNode!.parent!.value
            parentsList.append(newvalue)
            getListOfAncestors(newvalue, &parentsList)
        }else{
            return
        }
    }
    
    
    func getListOfAncestorsBetter(_ value1: Int,_ value2: Int, _ parentsList: inout [Int]){
        let currentNode1 = getNode(currentNode: root, value1)
        let currentNode2 = getNode(currentNode: root, value2)
        var newvalue1 = 0
        var newvalue2 = 0
        //print(parentsList)
            if currentNode1 != nil {
                if parentsList.contains(currentNode1!.value){
                    print("COMMON: ",currentNode1!.value)
                    return
                }
                parentsList.append(currentNode1!.value)
                //print("appending node 1: " ,currentNode1!.value)
                if let parent1 = currentNode1!.parent {
                    newvalue1 = parent1.value
                }
                
                //parentsList.append(newvalue1)
                //getListOfAncestors(newvalue, &parentsList)
            }
            if currentNode2 != nil {
                if parentsList.contains(currentNode2!.value){
                    print("COMMON: ",currentNode2!.value)
                    return
                }
                parentsList.append(currentNode2!.value)
                //print("appending node 2: " ,currentNode2!.value)
                if let parent2 = currentNode2!.parent {
                    newvalue2 = parent2.value
                }
                //parentsList.append(newvalue2)
            }
            getListOfAncestorsBetter(newvalue1, newvalue2, &parentsList)
        }
}





/*
 Input:
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 
 12
 1 2
 1 3
 2 4
 3 5
 3 6
 4 7
 4 8
 5 9
 5 10
 6 11
 6 12
 
 Output: (All The Parents)
 
 1
 6
 3
 1
 4
 4
 
 1
 1
 2
 3
 3
 4
 4
 5
 5
 6
 6
 
 */


func listAllParentsOfNodes(){
    
    let myTree = Tree()
    var numbersAdded = [Int]()
    let lines = Int(readLine()!)! - 1
    
    for n in 0..<lines {
        let firstLine = readLine()!.split(separator: " ")
        let n1 = Int(firstLine[0])!
        let n2 = Int(firstLine[1])!
        if n == 0 {
            myTree.add(value: 1) // adding the root
            numbersAdded.append(n1)
            myTree.add(value: n2, parentValue: 1)
            numbersAdded.append(n2)
        }else if numbersAdded.contains(n1){
            myTree.add(value: n2, parentValue: n1)
            numbersAdded.append(n2)
        } else{
            myTree.add(value: n1, parentValue: n2)
            numbersAdded.append(n1)
        }
    }
    
    numbersAdded.removeFirst()
    print("Parents: ")
    for n in numbersAdded {
        print(myTree.getParent(n)!.value)
    }
}


/*
 Input:
 5
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1
 
 
 Tree Generated:
 [
  [],
  [(3, 2)],
  [(4, 4)],
  [(1, 2), (4, 3)],
  [(2, 4), (3, 3), (5, 6)],
  [(4, 6)]
 ]

 Output:
 
 11 --> as the biggest diameter
 
 
 */


func AdjacencyListWeightedForTree() {
    let n = Int(readLine()!)!
    var adjList = Array<Array<(Int, Int)>>(repeating: [], count: n + 1)
    for _ in 1...n {
        let values = readLine()!.replacingOccurrences(of: " ", with:"").replacingOccurrences(of: "-1", with: "0").map({ Int(String($0))!})

        var pos = 0
        let u = Int(values[pos])
        pos += 1
        while values[pos] != 0 {
            let v = Int(values[pos])
            let w = Int(values[pos + 1])
            adjList[u].append((v: v, w: w)) // this is for directed, but by the input is undirected
            pos += 2
        }
    }
    print(adjList)
    
    // dfs (depth first search for Diameter)
    //var check: [Bool] = Array<Bool>(repeating: false, count: n + 1)
    //dfsWithWeightedEdges(start: 1, check: &check, adjList: &adjList)
    
    
    // for each leaf node
    var arrayOfDiameters = [Int]()
    for i in 0..<adjList.count {
        var check: [Bool] = Array<Bool>(repeating: false, count: n + 1)
        if adjList[i].count == 1 {
            dfsWithWeightedEdgesDiameter(start: i, check: &check, adjList: &adjList, count: 0, diameters: &arrayOfDiameters)
        }
    }
    
    

//    arrayOfDiameters.sort()
//    print(arrayOfDiameters)
    // printing the maximum
    print("Max Diameter: ",arrayOfDiameters.max()!)
}


func dfsWithWeightedEdgesDiameter(start: Int, check: inout [Bool], adjList: inout [[(Int,Int)]], count: Int, diameters: inout [Int]) {
    check[start] = true
    diameters.append(count)
    for next in adjList[start] {
        if check[next.0] == false {
            dfsWithWeightedEdgesDiameter(start: next.0, check: &check, adjList: &adjList, count: count + next.1, diameters: &diameters)
        }
    }
}
