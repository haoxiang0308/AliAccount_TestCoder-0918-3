// Определение структуры пользователя
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    // Вывод информации о пользователе
    println!("Пользователь: {}, возраст: {}", user.name, user.age);

    // Для сохранения в файл, используем форматированный вывод
    use std::fs::File;
    use std::io::Write;

    // Создаем файл со случайным именем (на основе временной метки)
    let file_name = format!("user_data_{}.txt", chrono::Utc::now().timestamp());
    let mut file = File::create(&file_name).expect("Не удалось создать файл");
    
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать в файл");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать в файл");
    
    println!("Данные пользователя сохранены в файл: {}", file_name);
}

// Добавляем использование chrono в начале файла
use chrono::prelude::*;