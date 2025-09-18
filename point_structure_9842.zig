// Point structure in Zig
// This structure represents a point in 2D space

const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Point = struct {
    x: f64,
    y: f64,

    // Initialize a new point
    pub fn init(x: f64, y: f64) Point {
        return Point{ .x = x, .y = y };
    }

    // Calculate distance to another point
    pub fn distance(self: Point, other: Point) f64 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return @sqrt(dx * dx + dy * dy);
    }

    // Move point by dx, dy
    pub fn translate(self: *Point, dx: f64, dy: f64) void {
        self.x += dx;
        self.y += dy;
    }

    // Print point coordinates
    pub fn print(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() !void {
    var point1 = Point.init(3.0, 4.0);
    var point2 = Point.init(0.0, 0.0);

    point1.print();
    point2.print();

    const dist = point1.distance(point2);
    std.debug.print("Distance: {d}\n", .{dist});

    point1.translate(1.0, 1.0);
    std.debug.print("After translation:\n");
    point1.print();
}