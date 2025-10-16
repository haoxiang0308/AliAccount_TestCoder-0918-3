import Foundation

/// Structure representing a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with given x and y coordinates
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    /// Calculates the distance from this point to another point
    func distance(to otherPoint: Point) -> Double {
        let deltaX = self.x - otherPoint.x
        let deltaY = self.y - otherPoint.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
    
    /// Returns a string representation of the point
    var description: String {
        return "Point(x: \(x), y: \(y))"
    }
}

// Example usage:
let origin = Point()
let pointA = Point(x: 3.0, y: 4.0)
let pointB = Point(x: 7.0, y: 1.0)

print(origin.description)  // Point(x: 0.0, y: 0.0)
print(pointA.description)  // Point(x: 3.0, y: 4.0)
print("Distance from A to B: \(pointA.distance(to: pointB))")