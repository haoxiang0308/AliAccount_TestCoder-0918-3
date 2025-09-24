import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    /// Координата X точки.
    var x: Double
    /// Координата Y точки.
    var y: Double
    
    /// Инициализирует новую точку с заданными координатами.
    /// - Parameters:
    ///   - x: Значение координаты X.
    ///   - y: Значение координаты Y.
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// Пример использования
let origin = Point(x: 0.0, y: 0.0)
let pointA = Point(x: 3.5, y: 7.2)

print("Origin: (\(origin.x), \(origin.y))")
print("Point A: (\(pointA.x), \(pointA.y))")
