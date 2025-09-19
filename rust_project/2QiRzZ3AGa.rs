// Определение структуры пользователя
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра пользователя
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    // Вывод информации о пользователе
    println!("Имя: {}", user.name);
    println!("Возраст: {}", user.age);
}