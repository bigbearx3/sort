//
//  Sorter.swift
//  SimpleTableView
//

import Foundation

class Sorter{
    static var states : [(Int, Int)] = []
    static var statesMerge : [[[Int]]] = []
    
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
                    states.append((j, j+1))
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
                states.append((j-1, j))
                j -= 1
            }
        }
    }
    
    static func mergeIterationSort(values : [Int]){
        var buf : [[Int]] = []
        for item in values{
            buf.append([item])
        }
        statesMerge.append(buf)
        var i = 0
        while buf.count > 1{
            i = 0
            while i + 1 <  buf.count {
                var lIndex = 0
                var rIndex = 0
                var left = buf[i]
                var right = (i + 1) != buf.count ? buf[i + 1] : []
                var temp : [Int] = []
                while lIndex < left.count && rIndex < right.count{
                    if left[lIndex] < right[rIndex]{
                        temp.append(left[lIndex])
                        lIndex += 1
                    }else{
                        temp.append(right[rIndex])
                        rIndex += 1
                    }
                }
                if lIndex < left.count{
                    temp.append(contentsOf : left[lIndex..<left.count])
                }else{
                    if rIndex < right.count{
                        temp.append(contentsOf: right[rIndex..<right.count])
                    }
                }
                buf[i] = temp
                buf.remove(at: i + 1)
                statesMerge.append(buf)
                i += 1                
            }            
        }
    }
    
    static private func merge(left : [Int], right : [Int]){
        
    }
        
    static func byQuick(values: inout [Int]){
    
    }
}


