import Foundation

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        // If they don't share the same repeating pattern, no answer
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        // GCD of lengths gives length of common base string
        let len1 = str1.count
        let len2 = str2.count
        let g = gcd(len1, len2)
        
        // Take that prefix from either string
        let endIndex = str1.index(str1.startIndex, offsetBy: g)
        return String(str1[..<endIndex])
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let tmp = x % y
            x = y
            y = tmp
        }
        return x
    }

print(gcdOfStrings("ABCABC", "ABC"))
