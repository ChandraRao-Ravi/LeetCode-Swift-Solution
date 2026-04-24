import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int: Int] = [:]
    for (index, number) in nums.enumerated() {
        let difference = target - number
        if let j = result[difference] {
            return [j, index]
        }
        result[number] = index
    }
    return []
}

print(twoSum([7,8,9,2], 9))
