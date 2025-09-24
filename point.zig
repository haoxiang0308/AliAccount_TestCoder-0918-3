const std = @import("std");

pub const Point = struct {
    x: f32,
    y: f32,

    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }

    pub fn distanceFromOrigin(self: Point) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

pub fn main() !void {
    const point = Point.init(3.0, 4.0);
    std.debug.print("Point: ({d}, {d})\n", .{ point.x, point.y });
    std.debug.print("Distance from origin: {d}\n", .{point.distanceFromOrigin()});
}