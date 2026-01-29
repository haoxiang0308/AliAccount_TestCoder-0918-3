// Rust 所有权（Ownership）概念演示
// 所有权是 Rust 的核心特性之一，用于管理内存安全

fn main() {
    println!("=== Rust 所有权概念演示 ===\n");

    // 1. 栈上数据（Copy 类型）- 数据复制，不转移所有权
    println!("--- 1. Copy 类型（栈上数据）---");
    let x = 5;
    let y = x;  // x 的值被复制给 y，x 仍然有效
    println!("x = {}, y = {}", x, y);
    println!("x 仍然有效，因为 i32 是 Copy 类型\n");

    // 2. 堆上数据（String）- 转移所有权（Move）
    println!("--- 2. 非 Copy 类型（堆上数据）---");
    let s1 = String::from("Hello, Rust!");
    let s2 = s1;  // s1 的所有权转移给 s2，s1 不再有效
    // println!("s1 = {}", s1);  // 这行会编译错误：value borrowed here after move
    println!("s2 = {}", s2);
    println!("s1 已失效，所有权已转移给 s2\n");

    // 3. 引用（Borrowing）- 不转移所有权
    println!("--- 3. 引用（Borrowing）---");
    let s3 = String::from("Reference example");
    let len = calculate_length(&s3);  // 借用 s3，不转移所有权
    println!("字符串 '{}' 的长度是: {}", s3, len);
    println!("s3 仍然有效，因为我们只是借用了它\n");

    // 4. 可变引用
    println!("--- 4. 可变引用（Mutable Reference）---");
    let mut s4 = String::from("Hello");
    change(&mut s4);
    println!("s4 = {}", s4);
    println!("s4 被成功修改，因为我们有可变引用\n");

    // 5. 返回值转移所有权
    println!("--- 5. 返回值转移所有权 ---");
    let s5 = String::from("Ownership");
    let s6 = gives_ownership(s5);
    println!("s6 = {}", s6);
    println!("s5 的所有权通过返回值转移给了 s6\n");

    // 6. 函数参数转移所有权
    println!("--- 6. 函数参数转移所有权 ---");
    let s7 = String::from("Transfer");
    takes_ownership(s7);
    // println!("s7 = {}", s7);  // 编译错误：s7 已移动
    println!("s7 的所有权已转移到函数中\n");

    // 7. 克隆（Clone）- 深拷贝堆上数据
    println!("--- 7. 克隆（Clone）---");
    let s8 = String::from("Clone me");
    let s9 = s8.clone();  // 深拷贝，s8 和 s9 都有效
    println!("s8 = {}, s9 = {}", s8, s9);
    println!("s8 和 s9 都有效，因为使用了 clone()\n");

    println!("=== 演示结束 ===");
}

// 计算字符串长度（借用不可变引用）
fn calculate_length(s: &String) -> usize {
    s.len()
}

// 修改字符串（借用可变引用）
fn change(s: &mut String) {
    s.push_str(", World!");
}

// 接收所有权并返回
fn gives_ownership(some_string: String) -> String {
    some_string
}

// 接收所有权（函数结束时释放）
fn takes_ownership(some_string: String) {
    println!("接收到字符串: {}", some_string);
}
