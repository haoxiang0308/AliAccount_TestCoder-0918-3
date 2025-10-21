// Определение структуры точки
const Point = struct {
    x: f32,
    y: f32,
};

// Пример экземпляра структуры
const example_point = Point{
    .x = 3.5,
    .y = 7.2,
};

// Функция для вывода информации о точке
pub fn printPoint(p: Point) void {
    std.debug.print("Point(x: {}, y: {})\n", .{ p.x, p.y });
}

const std = @import("std");

// Пример использования
pub fn main() void {
    printPoint(example_point);
}