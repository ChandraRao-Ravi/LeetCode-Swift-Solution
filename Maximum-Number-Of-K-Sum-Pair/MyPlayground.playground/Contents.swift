import Foundation

func maxOperations(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted() // Sort the array, so that small numbers on left, big numbers on right side.
    var numberOfOperations = 0 // initial number of operations
    var indexleft = 0 // left index to start looking for target sum pair
    var indexRight = nums.count - 1 // right index to start looking for target sum pair.
    
    while indexleft < indexRight {
        var currentSum = nums[indexleft] + nums[indexRight] // find current sum of pair.
        if currentSum == k { // sum matches target
            numberOfOperations += 1 // increase number of operations
            indexleft += 1 // increase left index
            indexRight -= 1 // decrease right index
        } else if currentSum < k { // sum is less than target
            indexleft += 1 // increase left index
        } else { // sum is greater than target
            indexRight -= 1 // decrease right index
        }
    }
    return numberOfOperations
}
print(maxOperations([4,4,1,3,1,3,2,2,5,5,1,5,2,1,2,3,5,4], 2))
