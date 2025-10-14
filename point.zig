const std = @import("std");
const print = std.debug.print;
const math = std.math;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        print("Usage: point <output_filename>\n", .{});
        return error.NoOutputFile;
    }

    const output_filename = args[1];

    // Create a random number generator
    var seed: u64 = undefined;
    try std.posix.getrandom(std.mem.asBytes(&seed));
    var prng = std.rand.DefaultPrng.init(seed);
    const random = prng.random();

    // Create a Point instance with random coordinates
    const point = Point{
        .x = random.float(f64) * 100.0, // Random x between 0 and 100
        .y = random.float(f64) * 100.0, // Random y between 0 and 100
    };

    print("Generated Point: x={d}, y={d}\n", .{ point.x, point.y });

    // Write the Point struct to the specified file in binary mode
    const file = try std.fs.cwd().createFile(output_filename, .{});
    defer file.close();

    try file.writeStruct(point);
    print("Point struct written to file: {s}\n", .{output_filename});
}

// Define the Point struct
const Point = struct {
    x: f64,
    y: f64,
};