fn main() {
    // --- 基本所有权转移示例 ---
    println!("--- 基本所有权转移示例 ---");
    {
        let s1 = String::from("hello"); // s1 获得 "hello" 字符串的所有权
        println!("s1 创建: {}", s1);

        let s2 = s1; // 所有权从 s1 转移 (move) 到 s2
        // println!("s1 现在为: {}", s1); // 这行代码会报错！因为 s1 不再有效
        println!("s2 接管了所有权: {}", s2);
    } // s2 在这里离开作用域，其内存被释放 (drop)

    // --- 函数传参与返回 ---
    println!("\n--- 函数传参与返回 ---");
    {
        let s3 = String::from("world");
        println!("传入函数前 s3: {}", s3);

        let s4 = takes_and_gives_back(s3); // s3 的所有权被转移给函数，函数返回所有权给 s4
        // println!("s3 现在为: {}", s3); // 这行代码会报错！因为 s3 的所有权已转移
        println!("函数返回后 s4: {}", s4);
    } // s4 在这里离开作用域并被释放

    // --- 引用与借用 ---
    println!("\n--- 引用与借用 ---");
    {
        let s5 = String::from("Rust");
        let len = calculate_length(&s5); // &s5 创建一个指向 s5 的引用，不转移所有权
        println!("字符串 '{}' 的长度是 {}。", s5, len); // s5 仍然有效，因为所有权未被转移

        // 可变引用示例
        let mut s6 = String::from("Hello");
        println!("修改前: {}", s6);
        change_string(&mut s6); // 传递一个可变引用
        println!("修改后: {}", s6);
    } // s5, s6 在这里离开作用域
}

// 函数获取所有权，然后返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    println!("函数内部接收到: {}", a_string);
    a_string // 返回 String，所有权转移给调用者
}

// 函数接收一个引用，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len() // 可以使用引用访问值，但不拥有它
}

// 函数接收一个可变引用，可以修改它指向的值
fn change_string(s: &mut String) {
    s.push_str(", World!"); // push_str() 在字符串末尾追加字面量
}