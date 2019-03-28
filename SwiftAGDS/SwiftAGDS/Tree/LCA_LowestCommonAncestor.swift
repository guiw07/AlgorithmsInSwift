//
//  LowestCommonAncestorACL.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-27.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation



func LowestCommonAncestor(){
    
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
    
    print()
    
// O(n)
//    let checks = Int(readLine()!)!
//
//    for _ in 0..<checks {
//        let line = readLine()!.split(separator: " ")
//        let n1 = Int(line[0])!
//        let n2 = Int(line[1])!
//      var list1 = [Int]()
//      var list2 = [Int]()
//      myTree.getListOfAncestors(n1, &list1)
//      myTree.getListOfAncestors(n2, &list2)
//      //print(list1)
//      //print(list2)
//      let output = list1.filter(list2.contains)
//        print("ACL of: \(n1) and \(n2) is: ",output.first!)
//    }
    
    let checks = Int(readLine()!)!
    for _ in 0..<checks {
        let line = readLine()!.split(separator: " ")
        let n1 = Int(line[0])!
        let n2 = Int(line[1])!
        var list1 = [Int]()
        myTree.getListOfAncestorsBetter(n1, n2, &list1)
    }
}
