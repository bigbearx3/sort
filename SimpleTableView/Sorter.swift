//
//  Sorter.swift
//  SimpleTableView
//

import Foundation

class Sorter{
    static func byBubble(values: inout [Int]){
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
    
    static func byInsertion(values: inout [Int]){
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
}


