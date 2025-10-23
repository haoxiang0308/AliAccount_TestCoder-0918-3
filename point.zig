const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Определяем структуру для точки
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    // Создаем экземпляр точки
    const point = Point{ .x = 3.5, .y = 7.2 };
    
    // Генерируем случайное имя файла
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    var random_name = ArrayList(u8).init(allocator);
    defer random_name.deinit();
    
    // Генерация случайного имени файла
    const random = std.crypto.random;
    try random_name.appendSlice("point_data_");
    
    for (0..8) |_| {
        const c = random.int(u8) % 62;
        if (c < 10) {
            try random_name.append(@as(u8, @intCast(c + '0')));
        } else if (c < 36) {
            try random_name.append(@as(u8, @intCast(c - 10 + 'A')));
        } else {
            try random_name.append(@as(u8, @intCast(c - 36 + 'a')));
        }
    }
    
    try random_name.appendSlice(".dat");
    
    // Сохраняем точку в файл
    const file = try std.fs.cwd().createFile(random_name.items, .{});
    defer file.close();
    
    // Записываем данные точки в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    print("Точка ({d}, {d}) сохранена в файл {s}\n", .{ point.x, point.y, random_name.items });
}