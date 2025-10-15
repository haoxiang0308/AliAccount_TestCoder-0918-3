// Rust 所有权概念演示

fn main() {
    // 1. 基本所有权示例
    println!("=== 基本所有权示例 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2，s1不再有效
    // println!("{}", s1);  // 这行会报错，因为s1不再有效
    println!("s2: {}", s2);

    // 2. 函数所有权转移示例
    println!("\n=== 函数所有权转移示例 ===");
    let s3 = String::from("world");
    takes_ownership(s3);  // s3的所有权转移到函数内部
    // println!("{}", s3);  // 这行会报错，因为s3的所有权已经转移
    
    let x = 5;
    makes_copy(x);  // x是Copy类型，值被复制而不是移动
    println!("x is still valid: {}", x);  // 这行可以正常执行

    // 3. 返回值和作用域
    println!("\n=== 返回值和作用域示例 ===");
    let s4 = gives_ownership();  // 函数返回值的所有权转移给s4
    println!("s4: {}", s4);
    
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5);  // 所有权转移给函数，然后返回
    println!("s6: {}", s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用示例 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);  // s7仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用示例 ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After change: {}", s8);

    // 6. 悬垂引用示例（注释掉，因为这会产生编译错误）
    println!("\n=== 悬垂引用示例（演示概念） ===");
    println!("下面的函数会返回一个悬垂引用，但Rust编译器会阻止这样做");
    // let reference_to_nothing = dangle();  // 这行会产生编译错误
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，其内存被释放
}

fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但i32实现了Copy trait，所以不会发生移动
}

fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权转移给调用者
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 将所有权返回给调用者
}

fn calculate_length(s: &String) -> usize {
    s.len()  // 通过引用访问值，不获取所有权
}  // 引用s离开作用域，但不释放引用的值

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}  // 可变引用some_string离开作用域

// 这个函数会产生编译错误，因为试图返回一个悬垂引用
// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s  // s离开作用域，其内存被释放，返回悬垂引用
// }

// 正确的做法是返回所有权
fn no_dangle() -> String {
    let s = String::from("hello");
    s  // 返回值的所有权
}