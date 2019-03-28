//
//  Heap.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-25.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

struct Heap<E> : CustomStringConvertible {
  var description: String {
    return nodes.description
  }
  
  private var nodes = [E]()
  
  private var order: (E, E) -> Bool
  
  var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  var count: Int {
    return nodes.count
  }
  
  /// Creates an empty heap
  /// The order function determines whether this is a min-heap or max-heap
  /// For comparable data types, > makes a max-heap, < makes a min-heap
  init(sort: @escaping (E, E) -> Bool) {
    order = sort
  }
  
  @inline(__always) func parent(of i: Int) -> Int {
    return (i - 1) / 2
  }
  
  @inline(__always) func left(of i: Int) -> Int {
    return i * 2 + 1
  }
  
  @inline(__always) func right(of i: Int) -> Int {
    return i * 2 + 2
  }
  
  public func max() -> E? {
    return nodes.first
  }
  
  mutating func insert(_ value: E) {
    nodes.append(value)
    bubbleUp(nodes.count - 1)
  }
  
  mutating func bubbleUp(_ index: Int) {
    var index = index
    let current = nodes[index]
    var parentIndex = parent(of: index)
    while index > 0 && order(nodes[index], nodes[parentIndex]) {
      nodes[index] = nodes[parentIndex]
      index = parentIndex
      parentIndex = parent(of: index)
    }
    nodes[index] = current
  }
  
  mutating func heapify(_ index: Int) {
    heapify(from: index, until: count)
  }
  
  mutating func heapify(from i: Int, until j: Int) {
    let l = left(of: i)
    let r = right(of: i)
    var current = i
    if l < j && order(nodes[l], nodes[current]) {
      current = l
    }
    if r < j && order(nodes[r], nodes[current]) {
      current = r
    }
    if current != i {
      nodes.swapAt(i, current)
      heapify(from: current, until: j)
    }
  }
  
  mutating func extractFirst() -> E? {
    let max = nodes.first
    nodes.swapAt(0, nodes.count - 1)
    nodes.remove(at: nodes.count - 1)
    heapify(0)
    return max
  }
  
  mutating func replace(at index: Int, with value: E) {
    guard index < nodes.count, order(value, nodes[index]) else { return }
    nodes.remove(at: index)
    insert(value)
  }
}

extension Heap {
  /// O(nlogn), actually O(n)
  mutating func buildHeap(_ arr: [E]) {
    nodes = arr
    for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
      heapify(i)
    }
  }
  
  mutating func heapSort(_ arr: [E]) -> [E] {
    buildHeap(arr)
    return heapSort()
  }
  
  /// O(nlogn)
  mutating func heapSort() -> [E] {
    for i in stride(from: count - 1, to: 0, by: -1) {
      nodes.swapAt(i, 0)
      heapify(from: 0, until: i)
    }
    return nodes
  }
  
}
