// Rust 所有权演示

fn main() {
    // 栈上分配的简单类型，具有 Copy trait，赋值时会移动所有权
    let x = 5;
    let y = x; // x 的值被复制给 y，x 依然有效
    println!("x = {}, y = {}", x, y); // 这行代码可以正常编译

    // 堆上分配的字符串，不具有 Copy trait，赋值时会移动所有权
    let s1 = String::from("hello");
    let s2 = s1; // s1 的所有权被移动到 s2，s1 不再有效

    // println!("{}", s1); // 这行代码会导致编译错误，因为 s1 已经不再拥有数据
    println!("s2 = {}", s2); // 只能打印 s2

    // 函数传参也会移动所有权
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内部
    // println!("{}", s3); // 这行代码会导致编译错误

    // 返回值会将所有权转移回调用者
    let s4 = gives_ownership(); // s4 获得函数返回的 String 的所有权
    println!("s4 = {}", s4);

    let s5 = String::from("test");
    let s6 = takes_and_gives_back(s5); // s5 的所有权被移入函数，s6 获得返回值的所有权
    println!("s6 = {}", s6);
    // println!("{}", s5); // 这行代码会导致编译错误
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到的字符串: {}", some_string);
} // some_string 在这里离开作用域，其值被丢弃 (drop)

// 这个函数创建一个 String 并将其所有权返回给调用者
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // some_string 的所有权被返回
}

// 这个函数接收一个 String 的所有权，然后将其返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被直接返回，所有权转移给调用者
}