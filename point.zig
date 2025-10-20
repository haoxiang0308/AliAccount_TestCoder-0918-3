const std = @import("std");

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    z: f32 = 0.0,  // по умолчанию 0 для 2D точек
};

pub fn main() !void {
    // Создаем экземпляр точки
    const my_point = Point{ .x = 3.5, .y = 7.2, .z = 1.0 };
    
    // Генерируем случайное имя файла
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    var random_name: [16]u8 = undefined;
    const random = std.crypto.random;
    for (&random_name) |*byte| {
        byte.* = random.intRangeAtMost(u8, 'a', 'z');
    }
    
    // Добавляем расширение .dat
    const file_name = try std.fmt.allocPrint(allocator, "{s}.dat", .{random_name[0..]});
    defer allocator.free(file_name);
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(file_name, .{});
    defer file.close();
    
    // Записываем данные точки в файл
    try file.writer().print("Point: x={}, y={}, z={}\n", .{ my_point.x, my_point.y, my_point.z });
}