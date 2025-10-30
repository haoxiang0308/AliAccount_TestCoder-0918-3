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
    
    /// Returns a string representation of the point
    func description() -> String {
        return "Point(x: \(x), y: \(y))"
    }
}

// Example usage:
let point = Point(x: 3.5, y: 7.2)
print(point.description())