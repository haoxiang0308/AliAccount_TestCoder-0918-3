// Структура пользователя с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Пользователь: {}, возраст: {}", user.name, user.age);
}