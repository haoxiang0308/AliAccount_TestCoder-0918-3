const std = @import("std");
const os = std.os;
const fs = std.fs;
const rand = std.rand;

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,

    // Простой способ сериализовать точку в строку
    fn toString(self: Point) [64]u8 {
        var buffer: [64]u8 = undefined;
        const len = std.fmt.bufPrint(&buffer, "Point({d}, {d})", .{ self.x, self.y }) catch {
            return buffer; // Возвращаем пустой буфер в случае ошибки
        };
        // Заполняем оставшуюся часть буфера нулями
        @memset(buffer[len..], 0);
        return buffer;
    }
};

pub fn main() !void {
    // Инициализируем точку
    const my_point = Point{ .x = 12.5, .y = -7.8 };

    // Создаём генератор случайных чисел
    var prng = rand.DefaultPrng.init(@as(u64, @intFromPtr(&my_point)));
    const random = prng.random();

    // Генерируем случайное имя файла
    var file_name_buffer: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (&file_name_buffer) |*byte| {
        byte.* = charset[random.uintLessThan(usize, charset.len)];
    }
    // Добавляем расширение
    const file_name = try std.fmt.allocPrint(std.heap.page_allocator, "{s}.txt", .{file_name_buffer[0..]});

    // Открываем файл для записи
    const file = try fs.cwd().createFile(file_name, .{ .read = true });

    // Сериализуем точку в строку
    const point_str = my_point.toString();

    // Записываем строку в файл
    try file.writeAll(point_str[0..std.mem.len(point_str)]);
    file.close();

    std.debug.print("Точка {d}, {d} сохранена в файл {s}\n", .{ my_point.x, my_point.y, file_name });
}