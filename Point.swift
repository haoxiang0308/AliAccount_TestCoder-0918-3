import Foundation

/// A structure representing a point in 2D space with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with the given x and y coordinates
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    /// Returns a point at the origin (0, 0)
    static func origin() -> Point {
        return Point(x: 0.0, y: 0.0)
    }
}

// Example usage:
let point1 = Point(x: 3.5, y: 7.2)
let origin = Point.origin()

print("Point 1: (\(point1.x), \(point1.y))")
print("Origin: (\(origin.x), \(origin.y))")