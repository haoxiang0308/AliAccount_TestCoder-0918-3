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

    // Код для сохранения в файл со случайным именем (реализация ниже требует Rust с установленным Cargo)
    /*
    use std::fs::File;
    use std::io::Write;
    use std::time::{SystemTime, UNIX_EPOCH};

    // Создаем файл со случайным именем (на основе временной метки)
    let time_now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Время раньше эпохи")
        .as_secs();
    let file_name = format!("user_data_{}.txt", time_now);
    
    let mut file = File::create(&file_name).expect("Не удалось создать файл");
    
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать в файл");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать в файл");
    
    println!("Данные пользователя сохранены в файл: {}", file_name);
    */
    
    println!("Структура User определена и готова к использованию.");
    println!("Чтобы сохранить данные в файл, раскомментируйте код выше и используйте Rust с Cargo.");
}