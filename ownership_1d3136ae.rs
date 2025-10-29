// Rust所有权概念演示

fn main() {
    println!("=== Rust所有权概念演示 ===\n");

    // 1. 基本所有权转移
    println!("1. 基本所有权转移:");
    let s1 = String::from("Hello");
    println!("创建s1: {}", s1);
    
    let s2 = s1; // 所有权从s1转移到s2，s1不再有效
    // println!("s1: {}", s1); // 这行会报错，因为s1的所有权已经转移
    println!("s2接管了所有权: {}", s2);
    println!();

    // 2. 函数中的所有权转移
    println!("2. 函数中的所有权转移:");
    let s3 = String::from("World");
    println!("函数调用前的s3: {}", s3);
    
    take_ownership(s3); // s3的所有权转移到函数内部
    // println!("函数调用后的s3: {}", s3); // 这行会报错
    
    let x = 5; // i32是Copy类型，不会转移所有权
    makes_copy(x); // x的值被复制，所有权未转移
    println!("函数调用后x仍然可用: {}", x);
    println!();

    // 3. 返回值和作用域
    println!("3. 返回值和作用域:");
    let s4 = gives_ownership(); // 函数返回所有权给s4
    println!("gives_ownership函数返回的值: {}", s4);
    
    let s5 = String::from("Hello again");
    println!("s5在转移前: {}", s5);
    let s6 = takes_and_gives_back(s5); // s5的所有权转移到函数，然后返回给s6
    // println!("s5在转移后: {}", s5); // 这行会报错
    println!("takes_and_gives_back函数返回的值: {}", s6);
    println!();

    // 4. 引用和借用
    println!("4. 引用和借用:");
    let s7 = String::from("Hello, Rust");
    let len = calculate_length(&s7); // 传递s7的引用，不转移所有权
    println!("字符串 '{}' 的长度是: {}", s7, len); // s7仍然有效
    println!();

    // 5. 可变引用
    println!("5. 可变引用:");
    let mut s8 = String::from("Hello");
    println!("修改前: {}", s8);
    change(&mut s8); // 传递可变引用
    println!("修改后: {}", s8);
    println!();

    // 6. 悬垂引用演示（注释掉，因为这会产生编译错误）
    println!("6. 悬垂引用（被注释以避免编译错误）:");
    println!("// let reference_to_nothing = dangle(); // 这会创建悬垂引用");
    println!();

    println!("=== 所有权演示结束 ===");
}

// 函数获取字符串的所有权
fn take_ownership(some_string: String) {
    println!("函数内部接收到的字符串: {}", some_string);
    // 函数结束时，some_string被丢弃
}

// 函数接收Copy类型的值（不会转移所有权）
fn makes_copy(some_integer: i32) {
    println!("函数内部接收到的整数: {}", some_integer);
    // some_integer在这里被丢弃，但因为i32实现了Copy，所以原始值仍然有效
}

// 函数返回String的所有权
fn gives_ownership() -> String {
    let some_string = String::from("Hello from function");
    some_string // 返回所有权给调用者
}

// 函数接收所有权然后返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 返回所有权
}

// 使用引用计算长度（不获取所有权）
fn calculate_length(s: &String) -> usize {
    s.len() // 通过引用访问s，不拥有s
}

// 使用可变引用修改字符串
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}

// 这个函数演示悬垂引用问题（被注释以避免编译错误）
/*
fn dangle() -> &String {
    let s = String::from("hello");
    &s // 尝试返回指向s的引用，但s在函数结束时被丢弃
}
*/

// 正确的版本返回String而不是引用
fn no_dangle() -> String {
    let s = String::from("hello");
    s // 返回所有权而不是引用
}