//
//  Lotto.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-18.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

func lottoBacktracking(array: inout [Int], resultArray: inout [Int], pos: Int){
    var pos = pos
    if resultArray.count == 6 {
        print(resultArray)
    }else{
        if pos == array.count {
            return
        }
        while (pos != array.count){
        // choose
        resultArray.append(array[pos])
        // explore
        pos += 1
        lottoBacktracking(array: &array, resultArray: &resultArray, pos: pos)
        // unchose
        resultArray.removeLast()
        
        }
    }
}

func lottery() {
    
        let inputLine = readLine()!
        if inputLine == "0" {
            return
        }else {
            let inputarrayString = inputLine.split(separator: " ")
            var intArray = inputarrayString.map {Int($0)!} // mapping from String array to Int Array
            intArray.removeFirst()
            var resultArray = [Int]()
            lottoBacktracking(array: &intArray, resultArray: &resultArray, pos: 0)
       }
}
