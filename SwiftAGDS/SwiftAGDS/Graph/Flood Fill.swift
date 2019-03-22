//
//  Flood Fill.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-20.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation



// With this algorithm we count the number of island and change their value

//From:

/*
 7
 0110100
 0110101
 1110101
 0000111
 0100000
 0111110
 0111000
 */

//To:

/*
[[0, 2, 2, 0, 3, 0, 0],
 [0, 2, 2, 0, 3, 0, 3],
 [2, 2, 2, 0, 3, 0, 3],
 [0, 0, 0, 0, 3, 3, 3],
 [0, 4, 0, 0, 0, 0, 0],
 [0, 4, 4, 4, 4, 4, 0],
 [0, 4, 4, 4, 0, 0, 0]]
 */

func floodFillAreas(){
    
    let n = Int(readLine()!)!
    var matrix = [[Int]]()
    var answer = [Int]()
    
    for i in 0..<n {
        matrix.append([])
        let value = readLine()!.map({ Int(String($0))!})
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
    
    print(currentNumber - 2)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix.count {
            if matrix[i][j] != 0 && matrix[i][j] != 1 {
                answer.append(matrix[i][j])
            }
        }
    }
    
    answer.sort()
    var answer2 = [Int]()
    var number = answer[0]
    var count = 0
    for i in 0..<answer.count{
        if number != answer[i]{
            answer2.append(count)
            number = answer[i]
            count = 0
        }
        count += 1
    }
    answer2.append(count)
    answer2.sort()
    print(answer2)
    print(matrix)
}

//call dfs on matrix

func dfsMatrixFloodFill(_ matrix: inout [[Int]], _ ipos: Int, _ jpos: Int, _ currentNumber: Int){
    matrix[ipos][jpos] = currentNumber
    if ipos + 1 < matrix.count {
        if matrix[ipos + 1][jpos] == 1 {
            dfsMatrixFloodFill(&matrix, ipos + 1,jpos, currentNumber)
        }
    }
    if ipos - 1  >= 0 {
        if matrix[ipos - 1][jpos] == 1 {
            dfsMatrixFloodFill(&matrix, ipos - 1,jpos, currentNumber)
        }
    }
    if jpos + 1 < matrix.count {
        if matrix[ipos][jpos + 1] == 1 {
            dfsMatrixFloodFill(&matrix, ipos,jpos + 1, currentNumber)
        }
    }
    if jpos - 1 >= 0 {
        if matrix[ipos][jpos - 1] == 1 {
            dfsMatrixFloodFill(&matrix, ipos,jpos - 1, currentNumber)
        }
    }
}



// Counting the number of Inslands considering diagonals
func floodFillIslands(){
    var cols = 0
    var rows = 0
    repeat{
        let colsByRows = readLine()!.split(separator: " ")
        cols = Int(colsByRows[0])!
        rows = Int(colsByRows[1])!
        
        // initialize the Matrix
        var matrix = [[Int]]()
        
        // read the matrix
        for i in 0..<rows {
            matrix.append([])
            let colValues = readLine()!.replacingOccurrences(of: " ", with: "").map({ Int(String($0))!})
            for j in 0..<cols{
                matrix[i].append(colValues[j])
            }
        }
        
        var currentNumber = 2
        for i in 0..<matrix.count {
            for j in 0..<matrix.count {
                if matrix[i][j] == 0 {
                    continue
                }else if matrix[i][j] == 1 {
                    dfsMatrixFloodFillWithDiagonals(&matrix, i, j,currentNumber)
                    currentNumber += 1
                }
            }
        }
        print()
        print("Number of Islands: ",currentNumber - 2)
        
    }while cols != 0 && rows != 0
    
}


func dfsMatrixFloodFillWithDiagonals(_ matrix: inout [[Int]], _ ipos: Int, _ jpos: Int, _ currentNumber: Int){
    matrix[ipos][jpos] = currentNumber
    
    //Checking Diagonals
    
    
    // the top-left Diagonal
    if ipos - 1 >= 0 && jpos - 1 >= 0 {
        if matrix[ipos - 1][jpos - 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos - 1,jpos - 1, currentNumber)
        }
    }
    
    // the top-right Diagonal
    if ipos - 1 >= 0 && jpos + 1 < matrix[0].count {
        if matrix[ipos - 1][jpos + 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos - 1,jpos + 1, currentNumber)
        }
    }
    // the botton-left Diagonal
    if ipos + 1 < matrix.count && jpos - 1 >= 0 {
        if matrix[ipos + 1][jpos - 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos + 1,jpos - 1, currentNumber)
        }
    }
    
    // the botton-right Diagonal
    if ipos + 1 < matrix.count && jpos + 1 < matrix[0].count {
        if matrix[ipos + 1][jpos + 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos + 1,jpos + 1, currentNumber)
        }
    }
    
    if ipos + 1 < matrix.count {
        if matrix[ipos + 1][jpos] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos + 1,jpos, currentNumber)
        }
    }
    if ipos - 1  >= 0 {
        if matrix[ipos - 1][jpos] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos - 1,jpos, currentNumber)
        }
    }
    if jpos + 1 < matrix.count {
        if matrix[ipos][jpos + 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos,jpos + 1, currentNumber)
        }
    }
    if jpos - 1 >= 0 {
        if matrix[ipos][jpos - 1] == 1 {
            dfsMatrixFloodFillWithDiagonals(&matrix, ipos,jpos - 1, currentNumber)
        }
    }
}



struct Pair {
    let x: Int
    let y: Int
}


func ShortestPathMaze() {
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let height = firstLine[0]
    let width = firstLine[1]
    var check = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
    var grid = [[Int]]()
    
    for _ in 0..<height {
        grid.append(readLine()!.map { Int(String($0))! })
    }
    
    var queue = Queue<Pair>()
    check[0][0] = true
    queue.enqueue(Pair(x: 0, y: 0))
    while !queue.isEmpty {
        let next = queue.dequeue()!
        for i in 0..<4 {
            let nx = next.x + dx[i]
            let ny = next.y + dy[i]
            if 0 <= nx && nx < width && 0 <= ny && ny < height {
                if check[ny][nx] == false && grid[ny][nx] >= 1 {
                    queue.enqueue(Pair(x: nx, y: ny))
                    grid[ny][nx] = grid[next.y][next.x] + 1
                    check[ny][nx] = true
                }
            }
        }
    }
    print(grid[height-1][width-1])
}
