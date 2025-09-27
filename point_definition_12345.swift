import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    /// Координата X точки.
    var x: Double
    /// Координата Y точки.
    var y: Double
}

// Пример использования:
let pointA = Point(x: 3.5, y: 7.2)
let pointB = Point(x: -1.0, y: 4.8)

print("Точка A: (\(pointA.x), \(pointA.y))")
print("Точка B: (\(pointB.x), \(pointB.y))")