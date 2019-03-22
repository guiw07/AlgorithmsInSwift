//
//  AdjacencyMatrix.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-18.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

// INPUT
//6 8     // n, m (# of vertices, # of edges)
//1 2     // m edges
//1 5
//2 3
//2 4
//2 5
//5 4
//4 3
//4 6




import Foundation


func AdjacencyMatrix(){
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    var matrix: [[Int]] = []
    for _ in 0..<n {
        matrix.append(Array<Int>(repeating: 0, count: n))
    }
    
    
    //getting edges
    for i in 0..<m {
        let value = readLine()!.map({ Int(String($0))!})
        matrix[i].append(value[i])
    }
    
    for row in matrix {
        print(row)
    }
}

func AdjacencyMatrixWeighted(){
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    var matrix: [[Int]] = []
    for _ in 0..<n {
        matrix.append(Array<Int>(repeating: 0, count: n))
    }
    
    
    //getting edges
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])! - 1
        let v = Int(edge[1])! - 1
        let w = Int(edge[2])!
        
        matrix[u][v] = w
        matrix[v][u] = w
    }
    
    for row in matrix {
        print(row)
    }
}

