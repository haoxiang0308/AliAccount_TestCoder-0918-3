// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权
    // 字符串字面量 "hello" 是静态分配的，s1 拥有在堆上分配的 String
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. 移动语义 (Move)
    // 将 s1 的值移动到 s2，s1 不再有效，所有权转移给了 s2
    // Rust 不会进行深拷贝，而是直接移动堆上的数据所有权
    let s2 = s1; // s1 的所有权被移动到 s2
    // println!("s1: {}", s1); // 这一行会报错，因为 s1 已经不再有效
    println!("s2: {}", s2);

    // 3. 克隆 (Clone) - 堆上数据的深拷贝
    // 如果我们确实需要 s1 和 s3 各自拥有独立的数据副本，可以使用 clone()
    let s3 = String::from("world");
    let s4 = s3.clone(); // s4 是 s3 堆上数据的深拷贝
    println!("s3: {}", s3); // s3 仍然有效
    println!("s4: {}", s4); // s4 拥有独立的数据

    // 4. 函数参数的所有权
    let s5 = String::from("Rust");
    takes_ownership(s5); // s5 的所有权被移动到函数内部
    // println!("{}", s5); // 这里会报错，s5 不再有效

    let x = 5; // i32 是 Copy 类型
    makes_copy(x); // x 的值被复制到函数内部
    println!("x is still valid after function call: {}", x); // x 仍然有效

    // 5. 函数返回值的所有权
    let s6 = gives_ownership(); // 函数返回的值的所有权被移动给 s6
    println!("s6 received ownership: {}", s6);

    let s7 = String::from("from main");
    let s8 = takes_and_gives_back(s7); // s7 的所有权被移入函数，然后所有权被移出返回给 s8
    // println!("{}", s7); // s7 不再有效
    println!("s8 got ownership back: {}", s8);
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Took ownership and will print: {}", some_string);
    // some_string 在此作用域结束时离开作用域，其内存被释放 (drop)
}

// 这个函数获取一个 Copy 类型的值
fn makes_copy(some_integer: i32) {
    println!("Got a copy of integer: {}", some_integer);
    // some_integer 在此作用域结束时离开作用域，但因为它是 Copy 类型，所以只是简单地被丢弃，无事发生
}

// 这个函数返回一个 String 的所有权
fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string // some_string 的所有权被返回给调用者
}

// 这个函数获取一个 String 的所有权，然后返回它的所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 将传入的 String 的所有权返回
}