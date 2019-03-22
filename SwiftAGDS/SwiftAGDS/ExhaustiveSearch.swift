//
//  ExhaustiveSearch.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation



// print all possible binary representations within a given number of digits
// Time complexity O(2^n)
func printBinaryDigits(_ digits: Int, _ prefix: String = ""){
    if digits == 0 {
        print(prefix)
    } else {
        printBinaryDigits(digits - 1, prefix + "0")
        printBinaryDigits(digits - 1, prefix + "1")
    }
}

// print all possible decimal representations within a given number of digits
// Time complexity O(10^n)
func printDecimalDigits(_ digits: Int, _ prefix: String = ""){
    if digits == 0 {
        print(prefix)
    } else {
        for i in 0..<10{
            printDecimalDigits(digits - 1, prefix + String(i))
        }
    }
}

// Permutation of the characters of a String
// Time complexity O(n!)
func stringPermutation(_ word:String, _ soFar: String = ""){
    if word.count == 0 {
        print(soFar)
    }else{
        for i in 0..<word.count{
            let ch = word[i]
            stringPermutation(word[0,i] + word[(i+1),word.count], soFar + ch)
        }
    }
}


func rollDiceExaustiveSearch(_ n:Int, _ word:String){
    if n == 0{
        print(word)
    }else{
        for i in 1...6 {
            rollDiceExaustiveSearch(n - 1, word + String(i))
        }
    }
}
