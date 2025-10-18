use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};
use user_struct_demo::User;

fn main() {
    // Создаем экземпляр структуры User
    let user = User::new(String::from("Алексей"), 30);

    // Генерируем случайное имя файла на основе текущего времени
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let filename = format!("user_data/user_data_{}.txt", now.as_secs());

    // Сохраняем данные пользователя в файл
    let mut file = File::create(&filename)
        .expect("Не удалось создать файл");
    
    writeln!(file, "Имя: {}", user.name)
        .expect("Не удалось записать имя");
    writeln!(file, "Возраст: {}", user.age)
        .expect("Не удалось записать возраст");
    
    println!("Данные пользователя сохранены в файл: {}", filename);
    println!("Структура: {} ({} лет)", user.name, user.age);
}