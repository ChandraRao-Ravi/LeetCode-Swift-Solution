import Foundation

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var bed = flowerbed
        var remaining = n
        let count = bed.count
        
        for i in 0..<count {
            if remaining <= 0 { return true }
            
            if bed[i] == 0 {
                let leftEmpty  = (i == 0) || bed[i - 1] == 0
                let rightEmpty = (i == count - 1) || bed[i + 1] == 0
                
                if leftEmpty && rightEmpty {
                    bed[i] = 1
                    remaining -= 1
                }
            }
        }
        
        return remaining <= 0
    }

print(canPlaceFlowers([1,0,0,1,0], 2))
