import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var lastNonZero = 0
    
    // Move non-zero elements forward
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums[lastNonZero] = nums[i]
            lastNonZero += 1
        }
    }
    
    // Fill the rest with zeros
    while lastNonZero < nums.count {
        nums[lastNonZero] = 0
        lastNonZero += 1
    }
}

var numbers = [0,2,2,1,3,0,4]
moveZeroes(&numbers)
