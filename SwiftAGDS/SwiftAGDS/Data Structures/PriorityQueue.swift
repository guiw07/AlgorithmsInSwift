//
//  PriorityQueue.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-25.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

struct PriorityQueue<E> : CustomStringConvertible where E: Comparable {
  private var elements: Heap<E>
  
  var description: String {
    return elements.description
  }
  
  var isEmpty: Bool {
    return elements.isEmpty
  }
  
  var count: Int {
    return elements.count
  }
  
  /// Default Min-PriorityQueue
  init() {
    elements = Heap<E>(sort: <)
  }
  
  init(sort: @escaping (E, E) -> Bool) {
    elements = Heap<E>(sort: sort)
  }
  
  func peek() -> E? {
    return elements.max()
  }
  
  mutating func enqueue(_ elem: E) {
    elements.insert(elem)
  }
  
  mutating func dequeue() -> E? {
    return elements.extractFirst()
  }
  
  mutating func increaseKey(at index: Int, with value: E) {
    elements.replace(at: index, with: value)
  }
}
