//
//  SelfDividingNumbers.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-04-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//
/*
 
 A self-dividing number is a number that is divisible by every digit it contains.
 
 For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 
 Also, a self-dividing number is not allowed to contain the digit zero.
 
 Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
 
 Example 1:
 
 Input:
 left = 1, right = 22
 Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 Note:
 
 The boundaries of each input argument are 1 <= left <= right <= 10000.
 
 */


import Foundation

func checkDivisable(_ word:String,_ target: Int) -> Bool {
    if word.contains("0") {
        return false
    }
    for i in word {
        if target % Int(String(i))! != 0 {
            return false
        }
    }

    return true
}


func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var array = [Int]()
    for i in left...right {
        if checkDivisable(String(i), i) {
            array.append(i)
        }
    }
    return array
}
