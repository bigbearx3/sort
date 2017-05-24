//
//  Sorter.swift
//  SimpleTableView
//

import Foundation

class Sorter{
    static var statements : [(Int, Int)] = []
    
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
                    statements.append((j, j+1))
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
                statements.append((j-1, j))
                j -= 1
            }
        }
    }       
        
    static func byQuick(values: inout [Int]){
    
    }
}


