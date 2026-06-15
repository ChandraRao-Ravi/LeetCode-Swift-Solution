# Max Number of K-Sum Pairs (Swift)

This project contains a Swift implementation of a function that finds the maximum number of operations where, in each operation, you pick two numbers from the array whose sum equals `k` and remove them from the array.

## Problem Statement

You are given an integer array `nums` and an integer `k`.

In one operation:

- You can pick **two numbers** from the array whose sum equals `k`.
- Remove both numbers from the array.

Return the **maximum number of operations** you can perform on the array.

**Example**

- Input: `nums = [1,2,3,4]`, `k = 5`  
- Output: `2`  

Explanation:

- Start with `nums = [1,2,3,4]`
  - Remove `1` and `4` → `nums = [2,3]`
  - Remove `2` and `3` → `nums = []`
- No more pairs sum to `5`, so total operations = `2`. [web:47][web:53]

## Approach

This solution uses a **two-pointer** technique on a **sorted** array:

1. Sort the input array `nums` in non-decreasing order so that smaller numbers are on the left and larger on the right.
2. Initialize two indices:
   - `indexleft` starting at the beginning (`0`)
   - `indexRight` starting at the end (`nums.count - 1`)
3. While `indexleft < indexRight`:
   - Compute `currentSum = nums[indexleft] + nums[indexRight]`.
   - If `currentSum == k`:
     - You found a valid pair that sums to `k`.
     - Increment `numberOfOperations`.
     - Move both pointers inward: `indexleft += 1`, `indexRight -= 1` (since both elements are now “used”). [web:50][web:63]
   - Else if `currentSum < k`:
     - The sum is too small; move `indexleft` right (`indexleft += 1`) to try a **larger** number and increase the sum. [web:63][web:65]
   - Else (`currentSum > k`):
     - The sum is too large; move `indexRight` left (`indexRight -= 1`) to try a **smaller** number and decrease the sum.
4. When the pointers meet or cross, no more pairs can be formed; return `numberOfOperations`.

This works because in a sorted array, moving the left pointer right increases the sum, and moving the right pointer left decreases the sum, allowing us to systematically find all valid disjoint pairs that sum to `k`.

This runs in:

- Time complexity: **O(n log n)** — due to sorting; the two-pointer scan is O(n). [web:50][web:57]  
- Space complexity: **O(1)** — aside from the sorted copy and a few variables. [web:50][web:63]
