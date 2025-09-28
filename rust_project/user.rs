// Структура пользователя
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Пример создания экземпляра структуры
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User: {}, Age: {}", user.name, user.age);
}