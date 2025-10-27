// Определение структуры User с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры
fn example() {
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    // Здесь могла бы быть логика для сохранения в файл
    println!("Пример структуры: {}, {}", user.name, user.age);
}

fn main() {
    example();
}