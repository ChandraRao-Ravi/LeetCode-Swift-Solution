import Foundation

/*
 Problem: Untitled
 Difficulty: undefined
 
 Solution:
*/

Solution approach (brief):
- Use a dictionary (value -> index) to store numbers we've seen as we iterate.
- For each number nums[i], compute complement = target - nums[i]. If complement exists in the dictionary, we found the two indices.
- This yields a single-pass O(n) solution.

Swift implementation (complete, with comments, complexity, and tests):

```swift
import Foundation

// LeetCode-style Solution class
class Solution {
    /// Returns indices of the two numbers such that they add up to target.
    /// - Parameters:
    ///   - nums: array of integers
    ///   - target: integer target
    /// - Returns: array with two indices [i, j]
    ///
    /// Approach:
    /// - Use a dictionary mapping number -> its index seen so far.
    /// - For each number x at index i, check if (target - x) exists in the dictionary.
    /// - If it does, return [indexOfComplement, i].
    /// - Otherwise, store x -> i in the dictionary and continue.
    ///
    /// Time Complexity: O(n) — single pass through nums
    /// Space Complexity: O(n) — dictionary may store up to n entries
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Map from number value to its index
        var indexByValue = [Int: Int]()
        indexByValue.reserveCapacity(nums.count)
        
        for (i, num) in nums.enumerated() {
            let complement = target - num
            if let j = indexByValue[complement] {
                // Found complement earlier at index j
                return [j, i]
            }
            // Store current number with its index
            // If duplicate values appear later, we keep the earliest index
            indexByValue[num] = i
        }
        
        // According to the problem, there is exactly one solution.
        // Return empty array as a fallback (shouldn't happen for valid inputs).
        return []
    }
}

// ---------------------
// Test cases
// ---------------------
func runTests() {
    let solver = Solution()
    
    // Test 1
    let nums1 = [2, 7, 11, 15]
    let target1 = 9
    let result1 = solver.twoSum(nums1, target1)
    print("Test 1: nums = \(nums1), target = \(target1) -> result = \(result1)   (expected [0, 1])")
    
    // Test 2
    let nums2 = [3, 2, 4]
    let target2 = 6
    let result2 = solver.twoSum(nums2, target2)
    print("Test 2: nums = \(nums2), target = \(target2) -> result = \(result2)   (expected [1, 2])")
    
    // Test 3 (duplicates)
    let nums3 = [3, 3]
    let target3 = 6
    let result3 = solver.twoSum(nums3, target3)
    print("Test 3: nums = \(nums3), target = \(target3) -> result = \(result3)   (expected [0, 1])")
    
    // Test 4 (negative numbers)
    let nums4 = [-3, 4, 3, 90]
    let target4 = 0
    let result4 = solver.twoSum(nums4, target4)
    print("Test 4: nums = \(nums4), target = \(target4) -> result = \(result4)   (expected [0, 2])")
    
    // Test 5 (larger array)
    let nums5 = [1, 5, 3, 7, 2, 9]
    let target5 = 11
    let result5 = solver.twoSum(nums5, target5)
    print("Test 5: nums = \(nums5), target = \(target5) -> result = \(result5)   (expected [3, 5])")
    
    // Optionally assert correctness for the above expected outcomes
    assert(result1 == [0,1], "Test 1 failed")
    assert(result2 == [1,2], "Test 2 failed")
    assert(result3 == [0,1], "Test 3 failed")
    assert(result4 == [0,2], "Test 4 failed")
    assert(result5 == [3,5], "Test 5 failed")
    
    print("All tests passed.")
}

runTests()
```

Complexity recap:
- Time: O(n), where n = nums.count. Each element is processed once and dictionary lookups are O(1) on average.
- Space: O(n) for the dictionary storing seen values.
