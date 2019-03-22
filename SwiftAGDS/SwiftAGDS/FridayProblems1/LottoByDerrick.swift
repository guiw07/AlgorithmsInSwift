//
//  Lotto.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-15.
//  Copyright © 2019 Derrick Park. All rights reserved.
//
import Foundation

func lottoHelper(set: inout [Int], choices: inout [Int], index: Int) {
    if choices.count == 6 {
        print(choices)
        return
    } else {
        if index == set.count { return }
        // choose
        choices.append(set[index])
        // explore
        lottoHelper(set: &set, choices: &choices, index: index + 1)
        // unchoose
        choices.removeLast()
        // next choice
        lottoHelper(set: &set, choices: &choices, index: index + 1)
    }
}

func lotteryDerrick() {
    while true {
        let input = readLine()!
        if input == "0" { break }
        var numSet = Array<Int>(input.split(separator: " ").map { Int(String($0))! }[1...])
        var choices = [Int]()
        lottoHelper(set: &numSet, choices: &choices, index: 0)
        print()
    }
}
