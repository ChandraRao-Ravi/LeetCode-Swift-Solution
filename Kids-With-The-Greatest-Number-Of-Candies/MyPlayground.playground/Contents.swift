import Foundation

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    guard let maxCandies = candies.max() else { return [] }
    
    var result = [Bool]()
    result.reserveCapacity(candies.count)
    
    for c in candies {
        result.append(c + extraCandies >= maxCandies)
    }
    return result
}

print(kidsWithCandies([2,3,5,1,2], 3))
