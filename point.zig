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

    // Generate a random filename
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const rand = prng.random();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var filename_buf: [20]u8 = undefined;
    const filename = try std.fmt.bufPrint(&filename_buf, "point_data_{d:0>10}.zig", .{rand.int(u32)});

    // Write the point data to the file
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();

    try file.writer().print("Point: x = {}, y = {}\n", .{ point.x, point.y });
    try file.writer().print("Distance from origin: {}\n", .{point.distanceFromOrigin()});

    std.debug.print("Point data saved to {s}\n", .{filename});
}
