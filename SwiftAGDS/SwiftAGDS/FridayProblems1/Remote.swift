//
//  Remote.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-18.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


func stringPermutationToArray(_ size: Int, _ choises: inout [String], _ arrayofPerm: inout [String], _ allowedButtons: inout [String] ){
    if size == 0 {
        return // arrayofPerm.append(choises.joined())
    }else {
        for i in allowedButtons { // change this to variable
            // choose
            choises.append(i)
            arrayofPerm.append(choises.joined())
            // explore
            stringPermutationToArray(size - 1, &choises, &arrayofPerm, &allowedButtons)
            // un-choose
            choises.removeLast()
        }
    }
}


func remote() -> Int{
    
    let target = Int(readLine()!)!
    let _ = Int(readLine()!)!
    let buttonsBroken = readLine()!.split(separator: " ").map {String($0)}
    
    var setAllButtons = Set(["0","1","2","3","4","5","6","7","8","9"])
    let setBrokenButtons = Set(buttonsBroken)

    setAllButtons.subtract(setBrokenButtons)
    
    if target == 100 {
        return 0
    }
    
    var minOps = 10000000000
    var operations = 0
    
    var allowedButtons = Array(setAllButtons)
    var arrayOfPermutations = [String]()
    var choises = [String]()

   stringPermutationToArray(7, &choises, &arrayOfPermutations, &allowedButtons)
   for e in arrayOfPermutations{
       let numberGenerated = Int(e)!
       let plusMinusChannel = abs(numberGenerated - target)
       operations = String(numberGenerated).count + plusMinusChannel
       if operations <= minOps{
           minOps = operations
       }
   }
    return minOps
}
