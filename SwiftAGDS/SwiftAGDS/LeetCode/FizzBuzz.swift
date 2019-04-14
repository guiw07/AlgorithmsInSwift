//
//  FizzBuzz.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-04-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//
/*
 Write a program that outputs the string representation of numbers from 1 to n.
 
 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
 Example:
 
 n = 15,
 
 Return:
 [
 "1",
 "2",
 "Fizz",
 "4",
 "Buzz",
 "Fizz",
 "7",
 "8",
 "Fizz",
 "Buzz",
 "11",
 "Fizz",
 "13",
 "14",
 "FizzBuzz"
 ]
 */



import Foundation

func fizzBuzz(_ n: Int) -> [String] {
    // Guilherme
    var array = [String]()
    
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            array.append("FizzBuzz")
        } else if i % 3 == 0 {
            array.append("Fizz")
        } else if i % 5 == 0 {
            array.append("Buzz")
        } else {
            array.append(String(i))
        }
    }
    return array
}
