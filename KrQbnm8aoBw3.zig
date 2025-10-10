// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования
pub fn main() void {
    const my_point = Point{ .x = 3.5, .y = 7.2 };
    std.debug.print("Point: x={d}, y={d}\n", .{ my_point.x, my_point.y });
}

const std = @import("std");