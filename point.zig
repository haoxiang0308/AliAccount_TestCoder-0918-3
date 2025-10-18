const std = @import("std");
const print = std.debug.print;

// Определение структуры точки
const Point = struct {
    x: f64,
    y: f64,
    
    // Метод для вывода информации о точке
    pub fn display(self: Point) void {
        print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создание экземпляра точки
    const point = Point{ .x = 3.14, .y = 2.71 };
    
    // Вывод информации о точке
    point.display();
    
    // Генерация случайного имени файла
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    var rand = prng.random();
    
    var filename_buffer: [20]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    for (filename_buffer) |*byte| {
        byte.* = charset[rand.intRangeAtMost(usize, 0, charset.len - 1)];
    }
    
    const filename = try std.fmt.allocPrint(std.heap.page_allocator, "{s}.txt", .{filename_buffer[0..]});
    print("Случайное имя файла: {s}\n", .{filename});
    
    // Запись информации о точке в файл
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();
    
    try file.writeAll(try std.fmt.allocPrint(std.heap.page_allocator, "Point(x: {}, y: {})\n", .{ point.x, point.y }));
    
    print("Информация о точке сохранена в файл {s}\n", .{filename});
}