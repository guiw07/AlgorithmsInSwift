//
//  AStar.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-21.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

//
//func getH(_ iCurrent: Int, _ jCurrent: Int, _ iGoal: Int, _ jGoal: Int) -> Int{
//    
//    let ih = abs(iCurrent - iGoal)
//    let jh = abs(jCurrent - jGoal)
//    
//    return ih + jh
//}
//
//
//// get sucessors returns an array of tuples, may need to tweek a little bit in the positioning
//// as my maze is not n x n, but n x m
//func getSucessors(_ matrix: inout [[Int]], _ row: Int, _ col: Int) -> [(Int,Int)]{
//    var arrayOfSucessors = [(Int,Int)]()
//    
//    if row + 1 < matrix.count {
//        if matrix[row + 1][col] == 1 {
//            arrayOfSucessors.append((row + 1,col))
//        }
//    }
//    if row - 1  >= 0 {
//        if matrix[row - 1][col] == 1 {
//            arrayOfSucessors.append((row - 1,col))
//        }
//    }
//    if col + 1 < matrix.count {
//        if matrix[row][col + 1] == 1 {
//            arrayOfSucessors.append((row,col + 1))
//        }
//    }
//    if col - 1 >= 0 {
//        if matrix[row][col - 1] == 1 {
//            arrayOfSucessors.append((row,col))
//        }
//    }
//    return arrayOfSucessors
//}
//
//struct Node {
//    var rowValue = Int()
//    var colValue = Int()
//    var heuristicValue = Int()
//    var f = Int()
//}
//
//
//func aStar(){
//    
//    let start = Node(rowValue: 1, colValue: 2, heuristicValue: 30, f: 0)
//    while true {
//        
//        
//        
//        
//    }
//    
//    print(getH(0,0,15,15))
//    
//    
//    
//
//}
