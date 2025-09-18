// Point structure in Zig
const std = @import("std");

// Define a Point structure with x and y coordinates
pub const Point = struct {
    x: f32,
    y: f32,
    
    // Method to create a new point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }
    
    // Method to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }
    
    // Method to print point information
    pub fn print(self: Point, writer: anytype) !void {
        try writer.print("Point({d:.2}, {d:.2})", .{ self.x, self.y });
    }
};

// Example usage
pub fn main() !void {
    var point = Point.init(3.0, 4.0);
    
    const stdout = std.io.getStdOut().writer();
    try point.print(stdout);
    try stdout.print("\nDistance from origin: {d:.2}\n", .{point.distanceFromOrigin()});
}