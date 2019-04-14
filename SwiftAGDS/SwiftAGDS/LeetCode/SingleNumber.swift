//
//  SingleNumber.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-04-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

/*
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 
 */


import Foundation


func singleNumber(_ nums: [Int]) -> Int {
    // Guilherme
    // Creating a Dictionary
    var dictionary: [Int: Int] = [:]
    
    for i in 0..<nums.count{
        // try to get the value
        if dictionary[nums[i]] != nil {
            //if the value exists remove
            dictionary.removeValue(forKey: nums[i])
        }else{
            // if the value does not exist add
            dictionary[nums[i]] = i
        }
    }
    // the only value in the dictionary will be the unique
    return dictionary.popFirst()!.key
}
