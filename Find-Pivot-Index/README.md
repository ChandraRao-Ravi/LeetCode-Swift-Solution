# Find Pivot Index (Swift)

This project contains a Swift implementation of a function that finds the **pivot index** of an integer array, where the sum of all elements strictly to the left equals the sum of all elements strictly to the right.

## Problem Statement

Given an array of integers `nums`, calculate the **pivot index** of this array.

The pivot index is defined as the index `i` where:

- `sum(nums[0 ..< i]) == sum(nums[(i+1) ..< n])`  
- i.e., the sum of elements **strictly to the left** of `i` equals the sum of elements **strictly to the right** of `i`.

Additional rules:

- If multiple pivot indices exist, return the **leftmost** one.
- If no such index exists, return `-1`.

**Example**

- Input: `nums = [1,7,3,6,5,6]`  
  - Left sums at each index: `[0, 1, 8, 11, 17, 22]`  
  - Right sums at each index: `[27, 20, 17, 11, 6, 0]`  
  - At index `3`: left sum = `11`, right sum = `11` → pivot index = `3`  
- Input: `nums = [1,2,3]` → Output: `-1` (no index satisfies the condition).

## Approach

The solution uses a **total sum + running left sum** strategy (prefix-sum style):

1. Compute the **total sum** of the array once at the beginning (using a helper function `calculateSum`).
2. Initialize:
   - `leftSum = 0` to represent the sum of elements strictly to the left of the current index.
   - `pivotIndex = -1` as the default when no pivot is found.
3. Iterate through the array with index `i` and value `number`:
   - Compute the right sum as:
     ```swift
     rightSum = totalSum - leftSum - number
     ```
     This subtracts the left side and the current element from the total, leaving only the right side.
   - If `leftSum == rightSum`, you have found the pivot index:
     - Set `pivotIndex = i` and **return** it immediately (this ensures the leftmost pivot is returned).
   - If not equal, update:
     ```swift
     leftSum += number
     ```
     to include the current element in the left sum before moving to the next index.
4. If the loop completes without finding a pivot, return `pivotIndex` (which will still be `-1`).

This avoids recomputing left and right sums from scratch for every index and uses the total sum to derive the right sum in O(1) per index.

This runs in:

- Time complexity: **O(n)** — one pass to compute total sum, one pass to find the pivot index.  
- Space complexity: **O(1)** — uses a constant number of extra variables.
