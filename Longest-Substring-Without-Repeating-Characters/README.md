
# Longest Substring Without Repeating Characters (Swift)

## Problem Description
Given a string `s`, find the length of the longest substring without repeating characters. The substring must be contiguous, and characters cannot repeat within it.

Examples:
- Input: `"abcabcbb"` → Output: `3` (substring `"abc"`)
- Input: `"bbbbb"` → Output: `1` (substring `"b"`)
- Input: `"pwwkew"` → Output: `3` (substring `"wke"`)[web:67][page:1]

## How it Works (Step-by-Step)
1. Initialize two pointers `left = 0` and `right` that will move over the string, plus an integer `maxLen = 0` to track the best window length.
2. Maintain a dictionary `charIndex` where keys are characters and values are their latest indices in the string.
3. Iterate over the string using `enumerated()` so you get both `right` (index) and `char` (character) at each step.
4. For each character, check if it already exists in `charIndex` **and** its stored index is within the current window (`lastIndex >= left`). If so, move `left` to `lastIndex + 1` to shrink the window from the left and remove the duplicate from the window.
5. Update the dictionary entry for the current character: `charIndex[char] = right`.
6. Compute the current window length as `right - left + 1` and update `maxLen` if this window is longer than the previous best.
7. After the loop finishes, `maxLen` holds the length of the longest substring without repeating characters.

## Swift Implementation
```swift
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var maxLen = 0
        var charIndex = [Character: Int]()

        for (right, char) in s.enumerated() {
            if let lastIndex = charIndex[char], lastIndex >= left {
                left = lastIndex + 1
            }
            charIndex[char] = right
            maxLen = max(maxLen, right - left + 1)
        }

        return maxLen
    }
}
```

## Example Walkthrough
### Example 1
Input: `s = "abcabcbb"`
- Start: `left = 0`, `maxLen = 0`, `charIndex = [:]`.
- `right = 0`, `char = "a"`: not seen, window = `"a"`, length = 1, `maxLen = 1`.
- `right = 1`, `char = "b"`: not seen, window = `"ab"`, length = 2, `maxLen = 2`.
- `right = 2`, `char = "c"`: not seen, window = `"abc"`, length = 3, `maxLen = 3`.
- `right = 3`, `char = "a"`: seen at index 0 ≥ left, move `left = 1`, window = `"bca"`.
Continuing this way, the longest window length stays 3, so the answer is 3.[web:61][page:1]

### Example 2
Input: `s = "bbbbb"`
- Sequence of windows: `"b"`, `"b"`, `"b"`, ... because each new `"b"` forces `left` to move forward.
- Longest unique window length is 1, so output is 1.[web:64][page:1]

### Example 3
Input: `s = "pwwkew"`
- The best window is `"wke"` with length 3; note that `"pwke"` is not valid because it is not contiguous (substring vs subsequence).[web:64][web:67]

## Complexity Analysis
- Time Complexity: `O(n)` where `n` is the length of the string, because each character is visited at most twice (once by `right`, once by `left`).[web:61][page:1]
- Space Complexity: `O(min(n, m))` where `m` is the character set size, since the dictionary stores at most one entry per distinct character in the current window.[web:64][page:1]
