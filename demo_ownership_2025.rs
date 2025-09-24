// Rust 所有权演示
// 此程序演示了 Rust 的三个核心所有权规则

fn main() {
    // 规则 1: 每个值都有一个变量作为其所有者。
    // 变量 s1 是字符串 "hello" 的所有者。
    let s1 = String::from("hello");
    println!("s1 创建: {}", s1);

    // 规则 2: 在任何时间点，只有一个所有者。
    // 将 s1 赋值给 s2，这会将所有权从 s1 移动到 s2。
    // 这被称为“移动”（move）。s1 不再有效。
    let s2 = s1;
    println!("s1 移动到 s2, 现在 s2 是: {}", s2);
    // println!("s1 现在无效，尝试访问 s1 会导致编译错误: {}", s1); // 这行代码会报错

    // 规则 3: 当所有者超出作用域时，该值将被删除。
    // 当 main 函数结束时，s2 超出作用域，Rust 会自动调用 s2 的析构函数 (Drop trait) 来释放其内存。

    // 演示函数中的所有权转移
    let s3 = String::from("world");
    println!("s3 在 main 中创建: {}", s3);
    // 将 s3 的所有权转移给函数 `takes_ownership`
    takes_ownership(s3);
    // s3 在这里不再有效，因为所有权已被转移

    // 演示复制类型 (Copy trait)，例如整数，它们不遵循移动语义
    let x = 5;
    println!("x 在 main 中创建: {}", x);
    makes_copy(x); // x 的值被复制并传递给函数
    println!("x 在调用 makes_copy 后仍然有效: {}", x); // x 仍然可以使用
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数 `takes_ownership` 接收到: {}", some_string);
    // 函数结束时，`some_string` 超出作用域，其内存被释放
}

// 这个函数接收一个 i32 类型的值，i32 实现了 Copy trait
fn makes_copy(some_integer: i32) {
    println!("函数 `makes_copy` 接收到: {}", some_integer);
    // 函数结束时，`some_integer` 超出作用域，但因为是 Copy 类型，所以不做任何特殊处理
}