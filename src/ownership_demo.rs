fn main() {
    // 1. 栈上数据的移动 (Move)
    let x = 5;
    let y = x; // Copy trait，x的值被复制到y，x仍然可用
    println!("x = {}, y = {}", x, y);

    // 2. 堆上数据的移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // s1的所有权被移动到s2，s1不再有效
    // println!("{}", s1); // 这行代码会编译错误，因为s1已失效
    println!("s2 = {}", s2);

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 深拷贝，s3和s4都有效，但这是昂贵的操作
    println!("s3 = {}, s4 = {}", s3, s4);

    // 4. 函数与所有权
    let s5 = String::from("function");
    takes_ownership(s5); // s5的所有权被移动到函数内，此处s5失效
    // println!("{}", s5); // 编译错误

    let x2 = 10;
    makes_copy(x2); // x2的值被复制到函数内，此处x2仍然可用
    println!("x2 is still usable: {}", x2);

    // 5. 返回值与作用域
    let s6 = gives_ownership(); // 函数返回值的所有权转移给s6
    println!("s6 = {}", s6);

    let s7 = String::from("take_and_give_back");
    let s8 = take_and_give_back(s7); // s7的所有权移动到函数，函数返回值再移回s8
    println!("s8 = {}", s8);
    // s7在此处已失效
}

fn takes_ownership(some_string: String) {
    println!("Inside function, got ownership of: {}", some_string);
    // some_string 在函数结束时被drop
}

fn makes_copy(some_integer: i32) {
    println!("Inside function, got a copy of: {}", some_integer);
    // some_integer 在函数结束时被丢弃
}

fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 返回值所有权被移动给调用者
}

fn take_and_give_back(a_string: String) -> String {
    a_string // 所有权被移动进来，然后又移动出去
}