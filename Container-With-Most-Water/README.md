# Container With Most Water (Swift)

This project contains a Swift implementation of a function that computes the maximum amount of water that can be contained between two vertical lines represented by an array of heights.

## Problem Statement

Given an array of non-negative integers `height`, where each element represents the height of a vertical line on the x-axis, find two lines that together with the x-axis form a container such that the container contains the **most** water.

- Each index `i` corresponds to a vertical line at position `i` with height `height[i]`.
- The amount of water between lines at indices `i` and `j` is determined by:
  - Height = `min(height[i], height[j])`
  - Width  = `j - i`
  - Area   = `min(height[i], height[j]) * (j - i)` [web:1][web:28]

Return the **maximum** area possible.

**Example**

- Input: `height = [1,8,6,2,5,4,8,3,7]`  
- Output: `49`  

Explanation:

- Choosing lines at indices `1` (height `8`) and `8` (height `7`):
  - Width  = `8 - 1 = 7`
  - Height = `min(8, 7) = 7`
  - Area   = `7 * 7 = 49`

## Approach

The solution uses a **two-pointer** technique:

1. Initialize two pointers:
   - `leftBoundary` at the start of the array (`0`).
   - `rightBoundary` at the end of the array (`height.count - 1`). [web:1][web:28]
2. At each step, compute the current container area:
   - `length = min(height[leftBoundary], height[rightBoundary])`
   - `width = rightBoundary - leftBoundary`
   - `area = length * width`
   - Update `maxWater` with the maximum of previous `maxWater` and current `area`.
3. Move the pointer that points to the **shorter** line:
   - If `height[leftBoundary] < height[rightBoundary]`, increment `leftBoundary`.
   - Otherwise, decrement `rightBoundary`.  
   This is because the shorter line limits the water height; moving the taller one cannot increase the area.
4. Repeat this process while `leftBoundary < rightBoundary`.
5. Once the pointers meet, `maxWater` holds the maximum possible area, which is returned.

This strategy starts from the widest possible container and gradually reduces width, always trying to improve height by moving away from the limiting (shorter) side.

This runs in:

- Time complexity: **O(n)** — both pointers traverse the array at most once. [web:2][web:30]
- Space complexity: **O(1)** — only a constant amount of extra variables is used. [web:2][web:27]
