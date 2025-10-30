fn max(a: i32, b: i32) -> i32 {
    return if (a > b) a else b;
}

// Ejemplo de uso
pub fn main() void {
    const result = max(10, 20);
    std.debug.print("El máximo es: {}\n", .{result});
}

const std = @import("std");