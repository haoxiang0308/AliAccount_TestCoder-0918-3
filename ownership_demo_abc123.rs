fn main() {
    // --- 示例 1: 基本的所有权转移 ---
    println!("--- 示例 1: 基本的所有权转移 ---");
    {
        let s1 = String::from("hello"); // s1 获得 "hello" 字符串的所有权
        println!("s1 创建: {}", s1);

        let s2 = s1; // 所有权从 s1 转移到 s2
        // println!("s1 现在是: {}", s1); // 这行代码会报错，因为 s1 不再有效
        println!("s2 接管了所有权: {}", s2);
    } // s2 在这里离开作用域，其内存被释放

    // --- 示例 2: 函数调用与所有权 ---
    println!("\n--- 示例 2: 函数调用与所有权 ---");
    {
        let s3 = String::from("world");
        println!("传递给函数前 s3: {}", s3);
        takes_ownership(s3); // s3 的所有权被移动到函数内部
        // println!("函数调用后 s3: {}", s3); // 这行代码会报错
    }

    // --- 示例 3: 返回值与所有权 ---
    println!("\n--- 示例 3: 返回值与所有权 ---");
    {
        let s4 = gives_ownership(); // 函数返回一个值，所有权赋给 s4
        println!("函数返回后 s4: {}", s4);

        let s5 = String::from("Rust");
        println!("s5 创建: {}", s5);
        let s6 = takes_and_gives_back(s5); // s5 的所有权被转移，然后函数返回所有权给 s6
        // println!("s5 转移后: {}", s5); // 这行代码会报错
        println!("s6 接收了所有权: {}", s6);
    }
}

// 此函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到的字符串: {}", some_string);
} // some_string 在这里离开作用域，其内存被释放

// 此函数创建一个 String 并返回其所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 返回 String，所有权转移给调用者
}

// 此函数获取一个 String 的所有权，然后返回它
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 返回传入的 String，所有权转移给调用者
}