import Foundation

func maxArea(_ height: [Int]) -> Int {
    var leftBoundary = 0 // left boundary of the container
    var rightBoundary = height.count - 1 // right boundary of the container
    var maxWater = 0 // max amount of water which can be retained, kepps on updating based on iteration.
    if height.count <= 0 { return 0 }
    while (leftBoundary < rightBoundary) {
        // formula for area: length * width
        let length = min(height[leftBoundary], height[rightBoundary]) // Calcluate length
        let width = rightBoundary - leftBoundary // Calcluate length
        maxWater = max(maxWater, length * width) // store the maximum water area, between previously stored and current area
        if height[leftBoundary] < height[rightBoundary] { // water area will depend on smaller boundary, so which ever is smaller need to move
            leftBoundary += 1
        } else if height[rightBoundary] < height[leftBoundary] {
            rightBoundary -= 1
        }
    }
    return maxWater
}
print(maxArea([1,8,6,2,5,4,8,3,7]))
