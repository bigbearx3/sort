//
//  Sorter.swift
//  SimpleTableView
//

import Foundation

class Sorter{
    static func bubbleSort(values: inout [Int]){
        var isSorted :Bool
        var temp : Int
        for i in 0..<values.count {
            isSorted = true
            for j in 0..<values.count - i - 1 {
                if values[j] > values[j + 1]{
                    temp = values[j]
                    values[j] = values[j + 1]
                    values[j + 1] = temp
                    isSorted = false
                }
            }
            if isSorted {return}
        }
        return
    }
    
    static func insertionSort(values: inout [Int]){
        var j, temp : Int
        for i in 1..<values.count {
            j = i
            while j > 0 && values[j] < values[j - 1] {
                temp = values[j - 1]
                values[j - 1] = values[j]
                values[j] = temp
                j -= 1
            }
        }        
    }
    
    static func mergeSort(values: [Int], leftIndex : Int, rightIndex : Int) -> [Int] {
        func merge(left : [Int], right : [Int]) -> [Int]{
            var mergedArr : [Int] = []
            var mergeLeftIndex = 0
            var mergeRightIndex = 0
            while (mergeLeftIndex < left.count - 1) &&
                (mergeRightIndex < right.count - 1){
                    if left[mergeLeftIndex] < right[mergeRightIndex] {
                        mergedArr.append(left[mergeLeftIndex])
                        mergeLeftIndex += 1
                    }else{
                        mergedArr.append(right[mergeRightIndex])
                        mergeRightIndex += 1
                    }
            }
            if mergeLeftIndex < left.count - 1{
                mergedArr += left[mergeLeftIndex..<left.count]
            }else{
                mergedArr += right[mergeRightIndex..<right.count]
            }
            return mergedArr
        }
        
        if values.count <= 1 {
            return values
        }else {
            let middle  = leftIndex + (rightIndex - leftIndex)/2
            let leftArr = mergeSort(values: Array(values[leftIndex...middle]), leftIndex : leftIndex, rightIndex : middle)
            let rightArr = mergeSort(values: Array(values[(middle + 1)...rightIndex]), leftIndex : middle, rightIndex : rightIndex)
            return merge(left : leftArr, right : rightArr)
        }
    }
    
    static func byQuick(values: inout [Int]){
    
    }
}


