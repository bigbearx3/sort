//
//  Sorter.swift
//  SimpleTableView
//

import Foundation

class Sorter{
    static var states : [(Int, Int)] = []
    static var statesMerge : [[[Int]]] = []
    
    static func bubbleSortVisual(values: inout [Int]){
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
    
    static func bubbleSort(values: inout [Int]){
        var isSorted = false
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
    
    static func insertionSortVisual(values: inout [Int]){
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
    
    static func mergeIterationSortVisual(values : [Int]){
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
    
    static func mergeIterSort(values : [Int]){
        var buf : [[Int]] = []
        for item in values{
            buf.append([item])
        }
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
                i += 1
            }
        }
    }
    
    static func mergeRecSort(values : inout [Int]){
        var temp = [Int]()
        mSort(arr: &values, lo: 0, hi: values.count - 1, buf: &temp)
    }
    
    private static func mSort(arr : inout [Int] , lo : Int, hi : Int , buf : inout [Int]){
        if hi <= lo { return }
        let mid = lo + (hi - lo) / 2;
        mSort(arr: &arr, lo: lo, hi: mid, buf: &buf)
        mSort(arr: &arr, lo: mid + 1, hi: hi, buf : &buf)
        buf = Array(arr[lo...hi])
        //var temp = [Int]()
        print(buf)
        var pos1 = lo
        var pos2 = mid + 1
        var k = lo
        while pos1 <= mid && pos2 <= hi{
            if buf[pos1 - lo] < buf[pos2 - lo]{
                arr[k] = buf[pos1 - lo]
                pos1 += 1
                k += 1
            }else{
                arr[k] = buf[pos2 - lo]
                pos2 += 1
                k += 1
            }
        }
    }
    
    static func quickSort(values: inout [Int]){
        qSort(arr: &values, lo: 0, hi: values.count - 1)
    }
    
    private static func qSort(arr: inout [Int], lo : Int, hi : Int){
        if lo >= hi {
            return
        }
        let part = partition(arr: &arr, lo: lo, hi: hi)
        qSort(arr: &arr, lo: lo, hi: part - 1)
        qSort(arr: &arr, lo: part + 1, hi: hi)
    }
    
    private static func partition(arr : inout [Int], lo : Int, hi : Int) -> Int{
        var i = lo
        var j = hi
        let pivot = arr[hi]
        while(true){
            while i < j && arr[i] < pivot{ i += 1 }
            while i < j && arr[j] > pivot{ j -= 1 }
            if i < j {
                let temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }else{
                break
            }
        }
        return i
    }
}


