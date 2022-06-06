//
//  code.swift
//  leetcode
//
//  Created by Осмаев Руслан on 06.06.2022.
//

import Foundation

class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums1Size = nums1.count
        let nums2Size = nums2.count
        let mergedSize = nums1Size + nums2Size
        let tempIndex = mergedSize / 2
        var resultDict = [Int: Int]()
        
        var searchedIndexes = [Int]()
        
        var nums1Index = 0
        var nums2Index = 0
        
        if mergedSize % 2 == 0 {
            searchedIndexes.append(tempIndex - 1)
        }
        searchedIndexes.append(tempIndex)
        
        for index in 0..<mergedSize {
            let tempNums1 = nums1Index < nums1Size ? nums1[nums1Index] : Int.max
            let tempNums2 = nums2Index < nums2Size ? nums2[nums2Index] : Int.max
            
            if tempNums1 <= tempNums2 {
                resultDict[index] = tempNums1
                nums1Index += 1
            } else {
                resultDict[index] = tempNums2
                nums2Index += 1
            }
            
            if searchedIndexes.count == 2 {
                if index == searchedIndexes[1] {
                    let sum = resultDict[searchedIndexes[0]]! + resultDict[searchedIndexes[1]]!
                    return Double(sum) / 2.0
                }
            } else {
                if index == searchedIndexes[0] {
                    return Double(resultDict[searchedIndexes[0]]!)
                }
            }
        }
        return 0.0
    }
}
