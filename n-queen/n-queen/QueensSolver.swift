//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

// solved 8-Queen with 25944 Iterations
var count2 = 0
func solveQueensSlow(board: inout Board, queens:Int) -> Bool{
    count2 += 1
    if queens == 0 {
        return true
    }else{
        for i in 0..<board.size{
            for j in 0..<board.size{
                if board.isSafe(row: i, col:j) {
                    // chose
                    board.place(row: i, col: j)
                    
                    // explore
                    if solveQueensSlow(board: &board, queens: queens - 1){
                        return true
                    }
                    // unchose
                    board.remove(row: i, col: j)
                }
            }
        }
    }
    return false
}

// After Running the Algorithm with (N)^2 as N = N (Queens).
// It Was observable that at least 1 column holds a Queen

// So i found a Property that Each queen will be placed alone in any row for each column
// Somehow it works, I was able to solve 8^2 -> 8 Queens
// with 114 iterations

// Can it be faster ?

var count = 0
func solveQueens(board: inout Board, queens:Int) -> Bool{
    count += 1
    if queens == 0 {
        return true
    }else{
        for i in 0..<board.size{
            if board.isSafe(row: i, col:queens - 1) {
                // chose
                board.place(row: i, col: queens - 1)
                
                // explore
                if solveQueens(board: &board, queens: queens - 1){
                    return true
                }
                // unchose
                board.remove(row: i, col: queens - 1)
            }
        }
    }
    return false
}



// Auxiliary Functions for QS1

func checkCollisionsDiagonal(_ dpArray: inout [Int], _ dnArray: inout [Int]) -> Int {
    var countCollisions = 0;
    for i in 0..<dpArray.count{
        for j in 0..<dpArray.count{
            if dpArray[i] == dpArray[j] && (i != j){
                countCollisions += 1
            }
        }
    }
    for i in 0..<dnArray.count{
        for j in 0..<dnArray.count{
            if dnArray[i] == dnArray[j]  && (i != j){
                countCollisions += 1
            }
        }
    }
    return countCollisions
}

func populateDP(_ dpArray: inout[Int], array: [Int]){
    for i in 0..<array.count{
        dpArray[i] = i + array[i]
    }
}
func populateDN(_ dnArray: inout[Int],array: [Int]){
    for i in 0..<array.count{
        dnArray[i] = i - array[i]
    }
}

func populateAttackArray(_ dpArray: inout [Int], _ dnArray: inout [Int], _ attackArray: inout [Bool]) {
    
    var attacked = false
    for i in 0..<dpArray.count{
        for j in 0..<dpArray.count{
            if dpArray[i] == dpArray[j] && (i != j){
                attacked = true
                attackArray[i] = true
                attackArray[j] = true
            }
        }
        if attacked == false{
            attackArray[i] = false
        }
    }
    attacked = false
    for i in 0..<dnArray.count{
        for j in 0..<dnArray.count{
            if dnArray[i] == dnArray[j] && (i != j){
                attacked = true
                attackArray[i] = true
                attackArray[j] = true
            }
        }
        if attacked == false{
            attackArray[i] = false
        }
    }
}






// QS1 Without attacked Array
func QS1MyVersion(_ array: inout [Int]) -> Bool{
    var dp = [Int]()
    var dn = [Int]()
    for _ in 0..<array.count{
        dp.append(0)
        dn.append(0)
    }
    populateDP(&dp, array: array)
    populateDN(&dn, array: array)
    var totalCollisions = checkCollisionsDiagonal(&dp, &dn)
    while totalCollisions != 0 {
        array.shuffle()
        var swapsPerformed = 1
        while swapsPerformed != 0 {
            swapsPerformed = 0
            for i in 0..<array.count{
                for j in (i + 1)..<array.count{
                    let temp = array
                    var tempdp = dp
                    var tempdn = dn
                    populateDP(&tempdp, array: temp)
                    populateDN(&tempdn, array: temp)
                    array.swapAt(i, j)
                    populateDP(&dp, array: array)
                    populateDN(&dn, array: array)
                    if checkCollisionsDiagonal(&dp, &dn) <  checkCollisionsDiagonal(&tempdp, &tempdn) {
                        swapsPerformed += 1
                        continue
                    }else{
                        array = temp
                        populateDP(&dp, array: array)
                        populateDN(&dn, array: array)
                    }
                    if checkCollisionsDiagonal(&dp, &dn) == 0 {
                        return true
                    }
                }
            }
        }
        totalCollisions = checkCollisionsDiagonal(&dp, &dn)
    }
    return false
}




func QS1(_ array: inout [Int]) -> Bool{
    var attacked = [Bool]()
    var dp = [Int]()
    var dn = [Int]()
    for _ in 0..<array.count{
        dp.append(0)
        dn.append(0)
        attacked.append(false)
    }
    var totalCollisions = 1
    while totalCollisions != 0 {
        array.shuffle()
        populateDP(&dp, array: array)
        populateDN(&dn, array: array)
        populateAttackArray(&dp, &dn, &attacked)
        var swapsPerformed = 1
        while swapsPerformed != 0 {
            swapsPerformed = 0
            for i in 0..<array.count{
                for j in (i + 1)..<array.count{
                    if attacked[i] || attacked[j] {
                        let temp = array
                        var tempdp = dp
                        var tempdn = dn
                        populateDP(&tempdp, array: temp)
                        populateDN(&tempdn, array: temp)
                        
                        //perform the SWAP
                        array.swapAt(i, j)
                        populateDP(&dp, array: array)
                        populateDN(&dn, array: array)
                        
                        // check if the Swap got a better H value
                        if checkCollisionsDiagonal(&dp, &dn) <  checkCollisionsDiagonal(&tempdp, &tempdn) {
                            swapsPerformed += 1
                            populateAttackArray(&dp, &dn, &attacked)
                        }else{
                            array = temp
                            populateDP(&dp, array: array)
                            populateDN(&dn, array: array)
                        }
                    }else{
                        if checkCollisionsDiagonal(&dp, &dn) == 0 {
                            //print the solution array
                            //print(array)
                            return true
                        }
                    }
                }
            }
        }
        totalCollisions = checkCollisionsDiagonal(&dp, &dn)
    }
    return false
}
