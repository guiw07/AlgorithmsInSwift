//
//  GraphComponents.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-19.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


//input
/*
 6 5 --> num of vertices / and num of edges
 1 2
 2 5
 5 1
 3 4
 4 6
 */

// i have to calculate not on the adjacentlist, but in the visited, for example

/*
 while all nodes haven't been visited. keep calling the next in the adjList
 */



func StoreInAdjacencyListConnectedComponents() {
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])! // num of vertices
    let m = Int(firstLine[1])! // num of edges
    var adjList = Array<Array<Int>>(repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v) // undirected u -> v, v -> u
        adjList[v].append(u)
    }
    
    // Count Components using DFS (Depth First Search)
    var check: [Bool] = Array<Bool>(repeating: false, count: n + 1)
    var count = 0
    for node in 1..<adjList.count {
        if !check[node]{
            dfs(start: node, check: &check, adjList: &adjList)
            count += 1
        }
    }
    print("components: \(count) ")
}

