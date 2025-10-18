use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    // Генерируем "случайное" имя файла на основе текущего времени
    let start = SystemTime::now();
    let since_the_epoch = start.duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", since_the_epoch.as_secs());

    // Сохраняем данные о пользователе в файл
    let mut file = File::create(&random_filename)
        .expect("File creation failed");
    
    writeln!(file, "Name: {}", user.name).expect("Write failed");
    writeln!(file, "Age: {}", user.age).expect("Write failed");
    
    println!("User data saved to file: {}", random_filename);
}