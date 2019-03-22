//
//  Queue.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-18.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

// Queue : FIFO ( First In First Out )
// enqueue --> add
// dequeue --> remove
// peek --> check the first element
// count --> number of elements
// isEmpty --> check if its empty

struct Queue<T> {
    var array = [T]()
    
    var count: Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    // O(1)
    mutating func enqueue(_ e: T) {
        array.append(e)
    }
    
    // O(n)
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }else{
            return array.removeFirst()
        }
    }
}
