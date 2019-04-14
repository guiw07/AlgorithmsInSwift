//
//  WhosMyParent.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-26.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

func WhosMyParent() {
  let n = Int(readLine()!)! // num of vertices
  var adjList = [[Int]](repeating: [], count: n + 1)
  var depth = [Int](repeating: 0, count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    adjList[u].append(v) // undirected u -> v, v -> u
    adjList[v].append(u)
  }
  
  depth[1] = 0
  check[1] = true
  var q = Queue<Int>()
  q.enqueue(1)
  parent[1] = 0
  while !q.isEmpty {
    let x = q.dequeue()!
    for v in adjList[x] {
      if (!check[v]) {
        depth[v] = depth[x] + 1
        check[v] = true
        parent[v] = x
        q.enqueue(v)
      }
    }
  }
  
  for i in 2...n {
    print(parent[i])
  }
}
