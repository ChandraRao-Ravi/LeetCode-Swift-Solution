import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var left = 0, maxLen = 0
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

print(lengthOfLongestSubstring("abcabcbb"))
