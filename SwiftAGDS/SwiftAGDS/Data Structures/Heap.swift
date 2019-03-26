//
//  Heap.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-25.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

struct Heap<E> : CustomStringConvertible where E: Comparable {
  var description: String {
    return nodes.description
  }
  
  private var nodes = [E]()
  
  var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  var count: Int {
    return nodes.count
  }
  
  init() {
  }
  
  @inline(__always) func parent(of i: Int) -> Int {
    return Int((i - 1) / 2)
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
    var parentIndex = self.parent(of: index)
    while index > 0 && nodes[index] > nodes[parentIndex] {
      nodes[index] = nodes[parentIndex]
      index = parentIndex
      parentIndex = self.parent(of: index)
    }
    nodes[index] = current
  }
  
  mutating func maxHeapify(_ index: Int) {
    let l = self.left(of: index)
    let r = self.right(of: index)
    var largest = index
    if l < self.count && nodes[l] > nodes[index] {
      largest = l
    }
    if r < self.count && nodes[r] > nodes[largest] {
      largest = r
    }
    if largest != index {
      nodes.swapAt(index, largest)
      maxHeapify(largest)
    }
  }
  
  mutating func extractMax() -> E? {
    let max = nodes.first
    nodes.swapAt(0, nodes.count - 1)
    nodes.remove(at: nodes.count - 1)
    maxHeapify(0)
    return max
  }
  
  mutating func replace(at index: Int, with value: E) {
    guard index < nodes.count, nodes[index] < value else { return }
    nodes.remove(at: index)
    insert(value)
  }
}

extension Heap {
  mutating func buildMaxHeap(_ arr: [E]) {
    self.nodes = arr
    for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
      print(i)
      maxHeapify(i)
    }
  }
  
  mutating func heapSort(_ arr: [E]) -> [E] {
    var result = [E]()
    buildMaxHeap(arr)
    while !nodes.isEmpty {
      nodes.swapAt(count - 1, 0)
      result.append(nodes.remove(at: count - 1))
      maxHeapify(0)
    }
    return result
  }
}
