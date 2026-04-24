import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (i, n) in nums.enumerated() {
        let diff = target - n
        if let j = map[diff] {
            return [j, i]
        }
        map[n] = i
    }
    return []
}

print(twoSum([2,7,11,15], 9))
