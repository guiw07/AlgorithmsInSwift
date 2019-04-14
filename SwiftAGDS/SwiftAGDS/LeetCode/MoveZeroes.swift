//
//  MoveZeroes.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-04-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

/*
Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.
*/
import Foundation

func moveZeroes(_ nums: inout [Int]) {
    // Guilherme
    var zeroPos = 0
    for i in 0..<nums.count{
        if nums[i] == 0 && nums[zeroPos] != 0 {
            zeroPos = i
        }
        if nums[i] != 0 && nums[zeroPos] == 0 {
            nums.swapAt(i, zeroPos)
            zeroPos += 1
        }
    }
}
