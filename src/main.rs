use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};
use rand::random;

// Структура пользователя с полями имя и возраст
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

    // Генерация случайного имени файла на основе временной метки
    let time_now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Время раньше эпохи")
        .as_secs();
    
    // Добавим немного рандомности к имени файла
    let random_suffix = random::<u32>();
    let file_name = format!("user_data_{}_{}.txt", time_now, random_suffix);
    
    // Открытие файла для записи
    let mut file = File::create(&file_name).expect("Не удалось создать файл");
    
    // Запись данных пользователя в файл
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать имя в файл");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать возраст в файл");
    
    println!("Данные пользователя сохранены в файл: {}", file_name);
}