//
//  RemoteControl.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-15.
//  Copyright © 2019 Derrick Park. All rights reserved.
//
import Foundation
// return the number of presses if possible
// return 0 if not possible
func possible(ch: Int, broken: inout [Bool]) -> Int {
    var ch = ch
    if ch == 0 { return broken[0] ? 0 : 1 }
    var len = 0
    while ch > 0 {
        // check each digit
        if broken[ch % 10] {
            return 0
        }
        len += 1
        ch /= 10
    }
    return len
}

func remoteControl() {
    var broken = [Bool](repeating: false, count: 10)
    
    let n = Int(readLine()!)!
    let _ = Int(readLine()!)!
    
    let buttons = readLine()!.split(separator: " ").map { Int(String($0))! }
    for b in buttons {
        broken[b] = true
    }
    
    var currAnswer = abs(n - 100)
    // search for the minimum
    for ch in 0...1000000 {
        let len = possible(ch: ch, broken: &broken)
        if len > 0 {
            let plusMinusPresses = abs(ch - n)
            if currAnswer > (len + plusMinusPresses) {
                currAnswer = len + plusMinusPresses
            }
        }
    }
    print(currAnswer)
}
