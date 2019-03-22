//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-08.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//  Using Derrick Park String Extension
//

/*
 
 THREE LAWS OF RECURSION
 
 1. A recursive algorithm must have a base case.
 2. A recursive algorithm must change its state and move toward the base case.
 3. A recursive algorithm must call itself, recursively.
 
*/

import Foundation

/*
 Returns the Power of x^n Recursively
 */

func power(x: Int, exp n: Int) -> Int {
    //base case
    if n == 1{
        return x
    }
    //recursive case
    return x * power(x: x, exp: n-1)
}

/*
 Returns True or False if a String is or not Palindrome Recursively
 */
func isPalindrome(word: String) -> Bool{
    //base case
    if word.count <= 1{
        return true
    }
    
//    Checking the first and last character using string indexes
//    var lastIndex = word.index(before: word.endIndex) // this will get the last index of a String in Swift
//    if word[word.startIndex] != word[lastIndex]{
//        return false
//    }

    
    //recursive case
    
    // unwrapping the first character than the last character than comparing if first character is equal than last character
    if let first = word.first, let last = word.last, first != last {
        return false
    }
    
    let newtStart = word.index(word.startIndex, offsetBy: 1)
    let newEnd = word.index(word.endIndex, offsetBy: -1)
    let newWord = String(word[newtStart..<newEnd])
    return isPalindrome(word: newWord)
    
}

/*
 Prints the number converting from Decimal Base to Binary Base Recursively
 */
func printBinary(_ num: Int){
    // Base case
    
    if num < 0 {
        print ("-",terminator: "")
        printBinary(-num)
        return
    }
    if num < 2 {
        print(num,terminator: "")
        return
    }

    // Recursive Case
    printBinary(num / 2)
    print(num % 2,terminator: "")
}

/*
 Print the lines of a file in reverse order recursively
 */
func reverseLines(_ position:Int) {
    
    //reading from the file
    let contents = try! String(contentsOfFile: "/Users/guilherme/Desktop/SwiftAGDS/SwiftAGDS/File.txt", encoding: .utf8)
    let lines = contents.split(separator: "\n")
    if position < lines.count {
        reverseLines(position + 1)
        print(lines[position])
    }
}

/**
 *
 * Write a recursive function evaluate that accepts a string
 * representing a math expression and computes its value.
 * - The expression will be “fully parenthesized” and will
 *   consist of + and * on single-digit integers only.
 * - You can use a helper function. (Do not change the original function header)
 * - Recursion
 *
 * evaluate(“7")                 -> 7
 * evaluate(“(2+2)“)             -> 4
 * evaluate(“(1+(2*4))“)         -> 9
 *                  ^
 * evaluate(“((1+3)+((1+2)*5))“) -> 19
 *
 */


func evaluate(_ expr:String) -> Int {

   var index = 0
   return evaluateHelper(expr,&index)
}

func evaluateHelper(_ expr: String, _ pos: inout Int) -> Int {
    if expr[pos].isDigits {
        return Int(expr[pos])!
    } else if expr[pos] == "(" {
        pos += 1
        let leftValue = evaluateHelper(expr, &pos)
        pos += 1
        let op = expr[pos]
        pos += 1
        let rightValue = evaluateHelper(expr, &pos)
        pos += 1
        if op == "+"{
            return leftValue + rightValue
        }else{
            return leftValue * rightValue
        }
        
    }
    return -1 // should never reach this
}



func fibonacci(_ n:Int) -> Int{
    if n == 1 {
        return 0
    }
    if n == 2 {
        return 1
    }
    return fibonacci(n-1) + fibonacci(n-2)
}


/*
We have triangle made of blocks. The topmost row has 1 block, the next row down has 2 blocks, the next row has 3 blocks, and so on.
Compute recursively (no loops or multiplication) the total number of blocks in such a triangle with the given number of rows.

triangle(0) → 0
triangle(1) → 1
triangle(2) → 3
*/

func triangleBlocks(_ n:Int) -> Int{
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 3
    }
    return triangleBlocks(n-1) + triangleBlocks(n-2)
}

/*
 Find in an Int array if the value 6 exists
*/

func array6(_ array:[Int], pos:Int) -> Bool{
    if array.count == pos{
        return false;
    }
    
    if array[pos] == 6 {
        return true;
    }
    
    return array6(array, pos: pos+1)
    
}

/*
 Returns the count of 11s that exists inside the array
 */

func array11(_ array:[Int],pos:Int) -> Int{
    var count = 0;
    if array.count == pos{
        return 0
    }
    if array[pos] == 11 {
        count += 1
        return count + array11(array, pos: pos+1);
    }
    return array11(array, pos: pos+1)
}











