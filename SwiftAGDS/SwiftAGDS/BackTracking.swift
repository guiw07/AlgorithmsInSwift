//
//  BackTracking.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-14.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


/*
 Backtracking Recursion to check if there is a sum of elements that is equal to the target from within an array of Ints
 */


func groupSum(_ array:[Int], pos:Int, target:Int) -> Bool{
    if array.count == pos{
        return target == 0
    }
    
    if groupSum(array, pos: pos+1, target: target - array[pos]) {
        return true;
    }
    
    if groupSum(array, pos: pos+1, target: target){
        return true;
    }
    
    return false;
}


func rollDiceBackTrackingHelper(num: Int, choises: inout [Int]){
    if num == 0 {
        print(choises)
    }else {
        for i in 1...6 {
            // choose
            choises.append(i)
            // explore
            rollDiceBackTrackingHelper(num: num-1, choises: &choises)
            // un-choose
            choises.removeLast()
        }
    }
}


func rollDiceBacktracking(num: Int){
    var choises = [Int]()
    rollDiceBackTrackingHelper(num: num, choises: &choises)
}




// My Version
func rollDiceBackSumTrackingHelper(num: Int, desiredSum:Int, choises: inout [Int]){
    if num == 0 && desiredSum == 0 {
        print(choises)
    }else {
        for i in 1...6 {
            // choose
            if (desiredSum - i) < 0{
                continue
            }else{
                choises.append(i)
                // explore
                rollDiceBackSumTrackingHelper(num: num-1, desiredSum: desiredSum - i, choises: &choises)
                // un-choose
                choises.removeLast()
            }
            
        }
    }
}


func rollDiceBacktrackingSum(num: Int, desiredSum: Int){
    var choises = [Int]()
    rollDiceBackSumTrackingHelper(num: num, desiredSum: desiredSum, choises: &choises)
}


// Derrick Version with huge tree pruning
var counter = 0
func rollDiceSumHelper(num: Int, desiredSum: Int, soFar: Int, choices: inout [Int]) {
    counter += 1
    if num == 0 {
        // if the sum of current choices == desiredSum
        //        let currentSum = choices.reduce(0) { $0 + $1 }
        if soFar == desiredSum {
            print(choices)
        }
    } else {
        for i in 1...6 {
            // choose
            if soFar + i + 1 * (num - 1) <= desiredSum
                && soFar + i + 6 * (num - 1) >= desiredSum {
                choices.append(i)
                // explore
                rollDiceSumHelper(num: num - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices)
                // unchoose
                choices.removeLast()
            }
        }
    }
}


func rollDiceSum(num: Int, desiredSum: Int) {
    var choices = [Int]()
    rollDiceSumHelper(num: num, desiredSum: desiredSum, soFar: 0, choices: &choices)
}
