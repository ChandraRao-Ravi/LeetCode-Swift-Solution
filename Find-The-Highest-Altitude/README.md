# Find the Highest Altitude (Swift)

This project contains a Swift implementation of a function that computes the highest altitude reached by a biker during a trip, given the altitude gains between consecutive points.

## Problem Statement

There is a biker going on a road trip consisting of `n + 1` points at different altitudes.  
The biker starts at point `0` with altitude `0`. You are given an integer array `gain` of length `n`, where `gain[i]` is the net gain in altitude between points `i` and `i + 1`.

Return the **highest altitude** the biker reaches during the trip.

**Example**

- Input: `gain = [-5,1,5,0,-7]`  
  - Altitudes: `[0, -5, -4, 1, 1, -6]`  
  - Output: `1`  

- Input: `gain = [-4,-3,-2,-1,4,3,2]`  
  - Altitudes: `[0, -4, -7, -9, -10, -6, -3, -1]`  
  - Output: `0`  

## Approach

The solution uses a **running sum (prefix sum)** approach:

1. Initialize:
   - `currentAltitude = 0` to represent the starting altitude at point `0`.
   - `maxAltitude = 0` to track the highest altitude reached so far (starting at 0).
2. Iterate through each value `gain[i]` in the `gain` array:
   - Update `currentAltitude += gain[i]` to get the altitude at the next point.
   - Update `maxAltitude = max(maxAltitude, currentAltitude)` to keep track of the highest altitude.
3. After processing all gains, return `maxAltitude`.

This works because the altitude at each point is just the sum of all gains up to that point starting from 0, and the answer is simply the maximum of those cumulative sums (including the initial 0).

This runs in:

- Time complexity: **O(n)** — we traverse the `gain` array once.  
- Space complexity: **O(1)** — only a constant number of variables are used.
