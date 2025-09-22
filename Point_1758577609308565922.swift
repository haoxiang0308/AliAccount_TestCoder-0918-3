import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Функция для вычисления расстояния до другой точки
    func distance(to other: Point) -> Double {
        let deltaX = x - other.x
        let deltaY = y - other.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
    
    // Функция для строкового представления точки
    func description() -> String {
        return "Point(x: \(x), y: \(y))"
    }
}
