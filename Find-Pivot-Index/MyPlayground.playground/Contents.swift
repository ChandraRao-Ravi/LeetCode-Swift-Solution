import Foundation

func pivotIndex(_ nums: [Int]) -> Int {
    let totalSum = calculateSum(nums) // Get Total Sum
    var pivotIndex = -1 // complete failure, no pivot can be found
    var leftSum = 0 // Sum of all the left elements before pivot element
    for (i, number) in nums.enumerated() {
        let rightSum = totalSum - leftSum - number // Sum of all the numbers at right of i
        if leftSum == rightSum { // if matching sum
            pivotIndex = i // Pivot index Found
            return pivotIndex
        }
        leftSum += number // If sum not matched, increase the sum of elemtents in the left side of the array and prep for next interation.
    }
    return pivotIndex
}

// Note: Utility Function to calculate Total Sum
func calculateSum(_ nums: [Int]) -> Int {
    var sum = 0
    for number in nums {
        sum += number
    }
    return sum
}

print(pivotIndex([1,7,3,6,5,6]))
