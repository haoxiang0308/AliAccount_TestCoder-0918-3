use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };

    // Генерируем случайное имя файла на основе текущего времени
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", since_the_epoch.as_secs());

    // Сохраняем структуру в файл в виде простого текста
    let data_to_write = format!("name: {}, age: {}", user.name, user.age);
    let mut file = File::create(&random_filename).unwrap();
    file.write_all(data_to_write.as_bytes()).unwrap();

    println!("Структура пользователя сохранена в файл: {}", random_filename);
}