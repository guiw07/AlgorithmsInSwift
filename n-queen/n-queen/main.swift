//
//  main.swift
//  n-queen
//
//  Created by Guilherme Wahlbrink on 2019-03-14.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

var nqueens = 10
print("Using solveQueens Backtracking with: " + String(nqueens) + " Queens\n")


var myBoard = Board.init(size: nqueens)

let start1 = DispatchTime.now()
let solvable = solveQueens(board: &myBoard, queens: nqueens)

print("Is it Solvable? " + String(solvable))

if solvable{
    print(myBoard.description)
}


let end1 = DispatchTime.now()
let nanoTime1 = end1.uptimeNanoseconds - start1.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
let timeInterval1 = Double(nanoTime1) / 1_000_000_000 // Technically could overflow for long running tests
var seconds1 = String(timeInterval1).components(separatedBy: ".")[0]
// 20 queens 51 seconds

print("It took " + seconds1 + " Seconds\n")







// Implementation of QS1 From Rok Sosic And Jun Gu
// Probabilistic Local Search Algorithm
// Using Heuristic as the sum of attacks by each queen.
// If H = 0 no queens are attacking or being attacked

// got 100Q in 3s, 5s, 8s, 15s
// got 200Q in 33s, 70s
// got 300Q in 120 seconds

nqueens = 200

print("Using QS1 (Probabilistic Local Search) with: " + String(nqueens)  + " Queens\n")


var array = [Int]()
for i in 0...nqueens - 1{
    array.append(i)
}

let start = DispatchTime.now()

//print(QS1MyVersion(&array))

let QS1solvable = (QS1(&array))


let end = DispatchTime.now()
let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
var seconds = String(timeInterval).components(separatedBy: ".")[0]


let sol = array

var otherBoard = Board.init(size: sol.count)

var check = false
for i in 0..<sol.count {
    //print(otherBoard.isSafe(row: i, col: sol[i]-1))
    check = otherBoard.isSafe(row: i, col: sol[i])
    if check == true {
        otherBoard.place(row: i, col: sol[i])
    } else {
        break
    }
    
}


print("Is it Solvable? QS1: " + String(QS1solvable) + ", Board checking: " + String(check))
print()
print("Solution Array: ")
print(sol)
print()
print("It took " + seconds + " Seconds")
print()
print()
//print(otherBoard)
