struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// Example usage:
let point = Point(x: 3.5, y: 4.2)
print("Point coordinates: (\(point.x), \(point.y))")