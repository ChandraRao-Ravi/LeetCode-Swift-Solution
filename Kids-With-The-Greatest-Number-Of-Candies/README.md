
# Kids With the Greatest Number of Candies (Swift)

## Problem Description
You are given an integer array `candies` where `candies[i]` represents the number of candies the `i`-th kid has, and an integer `extraCandies` representing extra candies you can give. For each kid, you give **all** `extraCandies` to that kid and ask: will they then have the **greatest** number of candies among all kids? You must return a boolean array `result` where `result[i]` is `true` if kid `i` can have the greatest number of candies after receiving all `extraCandies`, or `false` otherwise.

Note that multiple kids can tie for the greatest number of candies.

## How it Works (Step-by-Step)
1. **Find the current maximum candies**: Scan the `candies` array once to find `maxCandies`, the greatest number of candies any kid currently has. In Swift you can use `candies.max()` for this.
2. **Prepare a result array**: Initialize an empty boolean array `result` with capacity equal to `candies.count` to store answers for each kid.
3. **Check each kid**:
   - For each value `c` in `candies`, compute `c + extraCandies`.
   - If `c + extraCandies >= maxCandies`, it means that after giving all extra candies to this kid, they have **at least** as many candies as any other kid, so append `true` to `result`.
   - Otherwise, append `false`.[web:123][web:126]
4. **Return the result**: After processing all kids, return the `result` array, which has one boolean for each kid in the original order.

This requires only a couple of passes over the array and no complex data structures.

## Example Walkthrough
### Example 1
Input:
- `candies = [2, 3, 5, 1, 3]`
- `extraCandies = 3`

Step-by-step:
- `maxCandies = 5` (the third kid has 5 candies).[web:123]
- For each kid:
  - Kid 0: `2 + 3 = 5` → `5 >= 5` → `true`.
  - Kid 1: `3 + 3 = 6` → `6 >= 5` → `true`.
  - Kid 2: `5 + 3 = 8` → `8 >= 5` → `true`.
  - Kid 3: `1 + 3 = 4` → `4 < 5` → `false`.
  - Kid 4: `3 + 3 = 6` → `6 >= 5` → `true`.
- Output: `[true, true, true, false, true]`.[web:122][web:123]
