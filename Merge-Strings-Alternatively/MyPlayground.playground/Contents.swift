import Foundation

// Solution Template
func mergeAlternately(_ word1: String, _ word2: String) -> String {
    let array1 = Array(word1)
    let array2 = Array(word2)
    
    var i = 0
    var j = 0
    var result = ""
    
    while i < array1.count || j < array2.count {
        if i < array1.count {
            result.append(array1[i])
            i += 1
        }
        if j < array2.count {
            result.append(array2[j])
            j += 1
        }
    }
    return result
}

print(mergeAlternately("abcde", "fg"))
