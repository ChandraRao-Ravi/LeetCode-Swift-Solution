## Problem Description
You are given an integer array `flowerbed` where `flowerbed[i]` is `0` if the `i`-th plot is empty and `1` if it is already planted. Flowers **cannot** be planted in adjacent plots. You are also given an integer `n`, the number of new flowers you want to plant. Return `true` if it is possible to plant `n` new flowers in the `flowerbed` without violating the no-adjacent-flowers rule, and `false` otherwise.

## How it Works (Step-by-Step)
1. **Work on a mutable copy**: Since the input array may be immutable, copy `flowerbed` into a mutable array `bed` so you can mark where you plant new flowers.
2. **Track remaining flowers**: Store `remaining = n`. Each time you successfully plant a flower, decrement `remaining` by 1. If `remaining` ever becomes `0` or less, you can return `true` early because you have already planted enough flowers.
3. **Scan each plot from left to right**:
   - For each index `i`, only consider planting if `bed[i] == 0` (empty plot).
   - Check the left neighbor: it is considered empty if either `i == 0` (no left neighbor) or `bed[i - 1] == 0`.
   - Check the right neighbor: it is considered empty if either `i == count - 1` (no right neighbor) or `bed[i + 1] == 0`.[web:137][web:138]
4. **Plant condition**: If the current plot is empty and **both** neighbors (when they exist) are empty (`leftEmpty && rightEmpty`), you can safely plant a flower at `i`. Set `bed[i] = 1` and decrement `remaining`.
5. **Final check**: After scanning all plots, if `remaining <= 0`, return `true`; otherwise, return `false` because you could not fit all `n` flowers without violating the adjacency rule.


## Example Walkthrough
### Example 1
Input:
- `flowerbed = [1, 0, 0, 0, 1]`
- `n = 1`

Step-by-step:
- `count = 5`, `remaining = 1`.
- `i = 0`: `bed[0] = 1` → already planted, skip.
- `i = 1`: `bed[1] = 0`.
  - `leftEmpty` = (`i == 0`? no) → `bed[0] == 1` → `false`.
  - Since left is not empty, cannot plant here.
- `i = 2`: `bed[2] = 0`.
  - `leftEmpty` = `bed[1] == 0` → `true`.
  - `rightEmpty` = `bed[3] == 0` → `true`.
  - Both empty → plant at index 2: `bed` becomes `[1, 0, 1, 0, 1]`, `remaining = 0`.
- `remaining <= 0` → return `true`.

Output: `true` (we can place 1 new flower).[web:137][web:142]
