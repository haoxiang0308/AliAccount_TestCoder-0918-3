// Определение структуры User
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры
fn main() {
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User name: {}", user1.name);
    println!("User age: {}", user1.age);
}