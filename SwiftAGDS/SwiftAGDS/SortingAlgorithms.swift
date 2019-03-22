//
//  SortAlgorithms.swift
//  SwiftAGDS
//
//  Created by Guilherme Wahlbrink on 2019-03-12.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//

import Foundation

//1. Bubble Sort
// Time Complexity O(n^2)
// - too many swaps
// - bubble up the largest one to the right

func bubbleSort(_ arr:[Int]) -> [Int] {
    var arr = arr
    for i in 0..<arr.count {
        for j in 0..<(arr.count-i-1) {
            if arr[j] > arr[j+1] {
                //swap
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
    return arr
}




//2. Selection Sort
// Time Complexity O(n^2)
// - each scan select min and put in the left

func selectionSort(_ arr:[Int]) -> [Int] {
    var arr = arr
    for i in 0..<arr.count {
        //i: start index of the scan
        var min = i
        for j in (i+1)..<arr.count {
            if arr[j] < arr[min]{
                min = j
            }
        }
        //swap
        arr.swapAt(i,min)
    }
    return arr
}


//3. Insertion Sort
// Time Complexity O(n^2)
// - sorted | unsorted
// - inserting elements from unsorted portion into sorted portion

func insertionSort(_ arr:[Int]) -> [Int] {
    var arr = arr
    
    for i in 1..<arr.count{
        let toInsert = arr[i]
        var j = i - 1
        while j >= 0 {
            if toInsert < arr[j]{
                //shift
                arr[j+1] = arr[j]
            }else{
                break
            }
            j -= 1
        }
        arr[j+1] = toInsert
    }
    return arr
}



//Divide-Conquer Using Recursion

//4. Merge Sort
// Time Complexity O(n log n)
// Need to create a lot of new smaller arrays, so uses a lot of space
// Space Complecity O(n)

// mergeSort (divide)

func mergeSort(_ arr:[Int]) -> [Int]{
    var arr = arr
    if arr.count <= 1 {
        return arr
    }
    
    let mid = arr.count / 2
    let left = mergeSort(Array(arr[0..<mid]))
    let right = mergeSort(Array(arr[mid...]))
    
    return merge(left,right)
}

// merge (conquer

func merge(_ left:[Int],_ right:[Int]) -> [Int]{
    var i = 0,j = 0
    var merged:[Int] = []
    // i will acess left
    // j will acess right
    
    while i < left.count && j < right.count {
        if left[i] < right[j]{
            merged.append(left[i])
            i += 1
        }else{
            merged.append(right[j])
            j += 1
        }
    }
    if i == left.count {
        // leftover from right
        merged += right[j...]
    } else {
        // leftover from left
        merged += left[i...]
    }
    return merged
}

//5. Quick Sort
// Time Complexity O(n log n)
// Happens in-place the array
// Space Complecity O(1)


// quickSort(arr, low, high)
//  if low < high
//     pivot_i = partition(arr, low, high)
//       quickSort(arr[:pivot_i], 0, pivot_i-1)
//       quickSort(arr[pivot_i+1:], pivot_i+1, arr.count)


func quickSort(_ arr: inout [Int], _ low:Int, _ high:Int){
    if low < high{
        let pivot_index = partition(&arr, low, high)
        quickSort(&arr, low, pivot_index - 1)
        quickSort(&arr, pivot_index + 1, high)
    }
}

// partition(arr, low, high) -> Int
// - pivot_index = 0
// - iterate each element
//      if current_elem < pivot
//          swap with pivot_index
//          pivot_index ++
// - swap pivot_index with pivot(last_elem)
// - return index of pivot

func partition(_ arr: inout [Int], _ low:Int, _ high:Int) -> Int{
    var pivot_index = low
    let pivot = arr[high]
    for i in low...high {
        if arr[i] < pivot {
            arr.swapAt(i,pivot_index)
            pivot_index += 1
        }
    }
    arr.swapAt(pivot_index,high)
    return pivot_index;
}


