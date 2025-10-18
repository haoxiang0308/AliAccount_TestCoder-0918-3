import Foundation

/// A structure representing a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with the given x and y coordinates
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    /// Calculates the distance from this point to another point
    func distance(to other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
    
    /// Returns a string representation of the point
    var description: String {
        return "Point(x: \(x), y: \(y))"
    }
}

// Example usage:
let origin = Point(x: 0.0, y: 0.0)
let pointA = Point(x: 3.0, y: 4.0)

print(origin.description)  // Point(x: 0.0, y: 0.0)
print(pointA.description)  // Point(x: 3.0, y: 4.0)
print("Distance between points: \(origin.distance(to: pointA))")  // 5.0