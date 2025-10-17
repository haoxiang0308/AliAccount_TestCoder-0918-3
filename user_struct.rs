// Определяем структуру User с полями имя и возраст
#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

// Пример создания экземпляра структуры
fn main() {
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    println!("Пользователь: {:?}", user);
}