// Point structure in Zig
// This structure stores x and y coordinates of a point

const Point = struct {
    x: f32,
    y: f32,

    // Function to create a new point
    pub fn init(x: f32, y: f32) Point {
        return Point{ .x = x, .y = y };
    }

    // Function to calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }

    // Function to display point information
    pub fn display(self: Point) void {
        std.debug.print("Point({d}, {d})\n", .{self.x, self.y});
    }
};

const std = @import("std");

// Example usage
pub fn main() void {
    var point = Point.init(3.0, 4.0);
    point.display();
    std.debug.print("Distance from origin: {d}\n", .{point.distanceFromOrigin()});
}