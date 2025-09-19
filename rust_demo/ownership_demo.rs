fn main() {
    // 1. 栈上的数据拷贝 (Copy)
    let x = 5;
    let y = x; // i32 实现了 Copy trait，这里是拷贝
    println!("x = {}, y = {}", x, y); // x 仍然可以使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy，这里是移动
    // println!("{}", s1); // 这行代码会报错，因为 s1 的所有权已经移走了
    println!("s2 = {}", s2); // s2 现在拥有所有权

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 深拷贝，堆上的数据也被复制
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以使用

    // 4. 函数调用与所有权转移
    let s5 = String::from("function");
    takes_ownership(s5); // s5 的值被移动到函数内部
    // println!("{}", s5); // 这行代码会报错，s5 不再有效

    let i = 10;
    makes_copy(i); // i 的值被拷贝到函数内部
    println!("i is still usable: {}", i); // i 仍然可以使用，因为 i32 实现了 Copy

    // 5. 函数返回值与作用域
    let s6 = gives_ownership(); // gives_ownership 将返回值移出给 s6
    let s7 = String::from("back");
    let s8 = takes_and_gives_back(s7); // s7 被移动进函数，函数返回值再移出给 s8
    println!("s6: {}, s8: {}", s6, s8);
    // s7 在这里已经无效了

} // 所有变量在这里离开作用域，内存被释放。s6, s8 (以及之前被移动的s1,s3,s5,s7) 的析构函数被调用。

fn takes_ownership(some_string: String) { // some_string 进入作用域
    println!("Inside function, got ownership of: {}", some_string);
} // some_string 在这里离开作用域，`drop` 被调用，内存被释放。

fn makes_copy(some_integer: i32) { // some_integer 进入作用域
    println!("Inside function, got a copy of: {}", some_integer);
} // some_integer 离开作用域，没有特殊操作

fn gives_ownership() -> String { // 将返回值移出给调用它的函数
    let some_string = String::from("returned from function");
    some_string // 返回值被移出
}

fn takes_and_gives_back(a_string: String) -> String { // a_string 进入作用域
    a_string // 返回值被移出
}