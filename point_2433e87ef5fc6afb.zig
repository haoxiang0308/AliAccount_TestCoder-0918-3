// Point structure in Zig
const std = @import("std");

// Define a Point structure with x and y coordinates
pub const Point = struct {
    x: f64,
    y: f64,

    // Method to create a new point
    pub fn init(x: f64, y: f64) Point {
        return Point{ .x = x, .y = y };
    }

    // Method to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f64 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }

    // Method to print point information
    pub fn print(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() void {
    var point = Point.init(3.0, 4.0);
    point.print();
    std.debug.print("Distance from origin: {d}\n", .{point.distanceFromOrigin()});
}