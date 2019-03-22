//
//  LinearSearch.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-07.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

// Time Complexity O(n)
// Worst Case scenario is that the element I am searching is in the last position
func linearsearch(target: Int, from array: [Int]) -> Int {
    for (index,elem) in array.enumerated() {
        if elem == target {
            return index
        }
    }
    return -1
}


// Binary Search
// Time Complexity O(log n)
// - condition: elements need to be sorted

func binarySearch(_ arr:[Int], _ target: Int) -> Int {
    var lower = 0
    var upper = arr.count - 1
    
    while (lower <= upper) {
        let mid = (lower + upper) / 2
        if (arr[mid] == target){
            return mid
        }else if (arr[mid] < target){
            lower = mid + 1;
        }else {
            upper = mid - 1
        }
    }
    return -1 // no target
}
