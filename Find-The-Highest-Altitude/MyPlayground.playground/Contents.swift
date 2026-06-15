import Foundation

func largestAltitude(_ gain: [Int]) -> Int {
    var maxAltitude = 0 // Maximum Altitude which the biker has achived.
    var currentAltitude = 0 // Current altitude which biker is on.
    // Note: the array has gains, not current altitude hence need to calculate current Altitude, to identify the highest altitude.
    for gainedAltitude in 0..<gain.count { // iterate through the gain's
        currentAltitude += gain[gainedAltitude] // calculate current altitude.
        maxAltitude = max(currentAltitude, maxAltitude) // check which is greater, previously stored maxAltitude or the currentAltitude
    }
    return maxAltitude
}
