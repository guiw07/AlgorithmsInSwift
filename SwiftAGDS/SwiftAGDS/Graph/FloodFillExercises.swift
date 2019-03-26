//
//  FloodFillExercises.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-24.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation


//inut example

/*
 6 4
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 */

/*
 6 4
 0 -1 0 0 0 0
 -1 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 
 */

// -1 = no tomatoes
// 0 = unripe tomatoes
// 1 = already ripe tomatoes


func TomatoFarm(){
    
    var count = 0
    let colsByRows = readLine()!.split(separator: " ")
    let cols = Int(colsByRows[0])!
    let rows = Int(colsByRows[1])!
    
    // initialize the Matrix
    var matrix = [[Int]]()
        
    // read the matrix
    // also while reading te matrix, i need to store the start nodes
    
    var arrayOfNodes = Array<Pair>()

    
    for i in 0..<rows {
        matrix.append([])
        let colValues = readLine()!.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-1", with: "2").map({ Int(String($0))!})
        for j in 0..<cols{
            matrix[i].append(colValues[j])
            if matrix[i][j] == 1 {
                arrayOfNodes.append(Pair(x: i, y: j))
            }
        }
    }
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    var check = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
    while !availableNodes(&matrix) {
        var newArrayOfNodes = Array<Pair>()
        
        for tuple in arrayOfNodes{
            for i in 0..<4 {
                // generate the adjacents
                let nx = tuple.x + dx[i]
                let ny = tuple.y + dy[i]
                // check adjacents
                if 0 <= nx && nx < rows && 0 <= ny && ny < cols {
                    // check the value and if its visited
                    if check[nx][ny] == false && matrix[nx][ny] == 0 {
                        newArrayOfNodes.append(Pair(x: nx, y: ny))
                        matrix[nx][ny] = 1
                        check[nx][ny] = true
                        // checking if the value is -1, previous converted to 2
                    } else if check[nx][ny] == false && matrix[nx][ny] == 2 {
                        check[nx][ny] = true
                    }
                }
            }
            if newArrayOfNodes.isEmpty {
                // if there are no more neighbour nodes
                print(-1)
                return
            }
            arrayOfNodes = newArrayOfNodes
        }
    count += 1
 }
    
    print (count)
}

func availableNodes(_ matrix: inout [[Int]]) -> Bool{
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count{
            if matrix[i][j] == 0{
                return false
            }
        }
    }
    return true
}


struct PairValued {
    let x: Int
    let y: Int
    let value: Int
}


// first flooding all the islands, than calculating the distance from all the points from each island to the other islands
func BuildShortestBridge(){
    
    let n = Int(readLine()!)!
    var matrix = [[Int]]()
    
    for i in 0..<n {
        matrix.append([])
        let value = readLine()!.replacingOccurrences(of: " ", with: "").map({ Int(String($0))!})
        for j in 0..<n{
            matrix[i].append(value[j])
        }
    }
    
    var currentNumber = 2
    for i in 0..<matrix.count {
        for j in 0..<matrix.count {
            if matrix[i][j] == 0 {
                continue
            }else if matrix[i][j] == 1 {
                dfsMatrixFloodFill(&matrix, i, j,currentNumber)
                currentNumber += 1
            }
        }
    }
    
    var arrayOfNodes = Array<PairValued>()
    
    for i in 0..<matrix.count {
        for j in 0..<matrix.count {
            if matrix[i][j] != 0 {
                arrayOfNodes.append(PairValued(x: i, y: j, value: matrix[i][j]))
            }
        }
    }
    //print(matrix)
    
    // getting the sum of distance from all the nodes and adding to the count array
    var count = [Int]()
    for e in arrayOfNodes {
        for ee in arrayOfNodes {
            if e.value != ee.value {
                count.append(getDistance(e.x, e.y, ee.x, ee.y))
            }
        }
    }
    //sorting and getting the first element
    count.sort()
    print(count.first!)
}

func getDistance(_ iCurrent: Int, _ jCurrent: Int, _ iGoal: Int, _ jGoal: Int) -> Int{
    let ih = abs(iGoal - iCurrent)
    let jh = abs(jGoal - jCurrent)
    return (ih + jh) - 1
}
