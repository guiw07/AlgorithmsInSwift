//
//  ReverseInteger.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-04-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//
/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 
 Example 2:
 
 Input: -123
 Output: -321
 
 Example 3:
 
 Input: 120
 Output: 21
 
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */
import Foundation


func reverseInteger(_ x: Int) -> Int {
    // Guilherme
    var y = String(abs(x))
    if x < 0 {
        // negative numbers
        y = String(abs(x))
        let reversed = -1 * Int(String(y.reversed()))!
        if reversed <= -2147483651 {
            return 0
        }else {
            return reversed
        }
        
    } else {
        // positive numbers
        y = String(x)
        let reversed = Int(String(y.reversed()))!
        if reversed >= 2147483651 {
            return 0
        }else {
            return reversed
        }
    }
}
