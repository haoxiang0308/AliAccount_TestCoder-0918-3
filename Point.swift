import Foundation

/// A structure representing a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with the given x and y coordinates
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    /// Creates a point at the origin (0, 0)
    init() {
        self.x = 0.0
        self.y = 0.0
    }
}

// Example usage:
let origin = Point()
let point = Point(x: 3.5, y: 7.2)

print("Origin: (\(origin.x), \(origin.y))")
print("Point: (\(point.x), \(point.y))")