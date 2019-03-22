//
//  CycleGraph.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-20.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

func cyclicPermutationGraph() {
    // need to put a while for the number of tests
    
    var numTests = Int(readLine()!)!
    
    while numTests != 0 {
    let numberOfNodes = Int(readLine()!)!
    
    let input = readLine()!
    var permutation = Array<Int>(input.split(separator: " ").map { Int(String($0))! })
    
    //print(permutation)
    
    var adjList = Array<Array<Int>>(repeating: [], count: numberOfNodes + 1)
    for i in 1...permutation.count {
        adjList[i].append(permutation[i - 1]) // directed
    }
    
    
    //print(adjList)
    
    
    var check: [Bool] = Array<Bool>(repeating: false, count: numberOfNodes + 1)
    var count = 0
    for node in 1..<adjList.count {
        if !check[node]{
            dfs(start: node, check: &check, adjList: &adjList)
            count += 1
        }
    }
    print("components: \(count) ")
    
    numTests -= 1
    }
}




func cyclicGraphForSequenceOfNumbers(){

    let input = readLine()!.split(separator: " ")
    var number = String(Int(input[0])!) // first number
    let n = Double(input[1])! // value of pow
    
    var sequence = [Int]()
    var total = Int(number)!
    while true {
        number = String(total)
    
        let array = number.map({ Int(pow(Double(String($0))!,n)) })
        total = array.reduce(0, +)
        if let index = sequence.firstIndex(of: total) {
            print(index + 1)
            return
        }
        sequence.append(total)
    }
}
