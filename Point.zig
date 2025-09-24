// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования структуры
pub fn main() void {
    const origin = Point{ .x = 0.0, .y = 0.0 };
    const point_a = Point{ .x = 3.5, .y = 7.2 };

    // Печать координат точки
    std.debug.print("Origin: ({d}, {d})\n", .{ origin.x, origin.y });
    std.debug.print("Point A: ({d}, {d})\n", .{ point_a.x, point_a.y });
}

const std = @import("std");