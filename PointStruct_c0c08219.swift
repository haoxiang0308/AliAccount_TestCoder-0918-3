import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Optional: Add a description for easy printing
    func description() -> String {
        return "Point(x: \(x), y: \(y))"
    }
}