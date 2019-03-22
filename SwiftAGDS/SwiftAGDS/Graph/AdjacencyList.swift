//
//  AdjacencyList.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-18.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


func AdjacencyList() {
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
    print(adjList)
}

func AdjacencyListWeighted() {
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])! // num of vertices
    let m = Int(firstLine[1])! // num of edges
    var adjList = Array<Array<(Int, Int)>>(repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!
        adjList[u].append((v: v, w: w)) // undirected u -> v, v -> u
        adjList[v].append((v: u, w: w))
    }
    print(adjList)
}


