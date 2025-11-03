// Swift structure for a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    // Initialize with default values
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    // Method to calculate distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Method to calculate distance to another point
    func distanceTo(_ other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

// Example usage:
let point1 = Point(x: 3.0, y: 4.0)
let point2 = Point(x: 0.0, y: 0.0)

print("Point 1: (\(point1.x), \(point1.y))")
print("Distance from origin: \(point1.distanceFromOrigin())")
print("Distance between points: \(point1.distanceTo(point2))")