struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Optional: A method to calculate distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Optional: A method to calculate distance to another point
    func distance(to otherPoint: Point) -> Double {
        let dx = self.x - otherPoint.x
        let dy = self.y - otherPoint.y
        return sqrt(dx * dx + dy * dy)
    }
}

// Example usage:
let point1 = Point(x: 3.0, y: 4.0)
let point2 = Point(x: 0.0, y: 0.0)

print("Point 1: (\(point1.x), \(point1.y))")
print("Point 2: (\(point2.x), \(point2.y))")
print("Distance from point1 to origin: \(point1.distanceFromOrigin())")
print("Distance between points: \(point1.distance(to: point2))")