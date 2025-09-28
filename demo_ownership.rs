fn main() {
    // 基本类型 (i32) 实现了 Copy trait，赋值时会进行复制
    let x = 5;
    let y = x; // x 的值被复制给 y，x 依然有效
    println!("x = {}, y = {}", x, y);

    // 字符串类型 (String) 没有实现 Copy trait，赋值时会进行移动 (move)
    let s1 = String::from("hello");
    let s2 = s1; // s1 的所有权被移动到 s2，s1 不再有效
    // println!("{}", s1); // 如果取消注释，会导致编译错误，因为 s1 已被移动
    println!("s2 = {}", s2);

    // 函数调用也会转移所有权
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被转移到函数内部
    // println!("{}", s3); // 如果取消注释，会导致编译错误，因为 s3 的所有权已被转移

    // 返回值可以转移所有权
    let s4 = gives_ownership(); // 函数返回的值的所有权被赋给 s4
    println!("s4 = {}", s4);

    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5); // s5 的所有权被转移进函数，然后返回值的所有权赋给 s6
    println!("s6 = {}", s6);
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在这里离开作用域，其内存被释放 (drop)
}

// 这个函数创建一个 String 并将其所有权返回给调用者
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // some_string 的所有权被返回
}

// 这个函数接收一个所有权，然后将其返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 直接返回传入的 String 的所有权
}