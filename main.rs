use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

// Определяем структуру User с полями имя и возраст
#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    // Генерируем случайное имя файла на основе текущего времени
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("/workspace/user_output_{}.txt", now.as_secs());

    // Открываем файл для записи
    let mut file = File::create(&random_filename).expect("Не удалось создать файл");
    
    // Записываем данные пользователя в файл
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать имя");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать возраст");
    
    println!("Данные пользователя сохранены в файл: {}", random_filename);
    println!("Пользователь: {:?}", user);
}