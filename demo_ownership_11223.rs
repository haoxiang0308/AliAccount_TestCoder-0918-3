// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获取
    let s1 = String::from("hello"); // s1 绑定到字符串，拥有其所有权
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    let s2 = s1; // s1 的所有权被移动到 s2，s1 不再有效
    // println!("s1: {}", s1); // 这一行会报错，因为 s1 已被移动
    println!("s2: {}", s2);

    // 3. 克隆 (Clone) - 创建深拷贝
    let s3 = s2.clone(); // s3 是 s2 数据的一个全新副本，拥有自己的所有权
    println!("s2: {}", s2); // s2 仍然有效，因为 clone 创建了副本
    println!("s3: {}", s3); // s3 也是一个独立的变量

    // 4. 函数所有权传递
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被移动到函数内部
    // println!("{}", s4); // 这里 s4 已经无效

    // 5. 函数返回值的所有权
    let s5 = gives_ownership(); // 函数返回的值被移动到 s5
    println!("s5: {}", s5);

    let s6 = String::from("rust");
    let s7 = takes_and_gives_back(s6); // s6 被移动进函数，函数返回值被移动到 s7
    println!("s7: {}", s7); // s7 有效
    // println!("s6: {}", s6); // 这里 s6 已经无效
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到的值: {}", some_string);
} // some_string 在这里离开作用域，并被丢弃 (drop)

// 这个函数创建一个 String 并返回其所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // some_string 的所有权被返回
}

// 这个函数获取一个所有权，然后又返回它
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被返回，所有权移交给调用者
}