use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
use rand::Rng;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };

    // Генерируем случайное имя файла
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Сохраняем структуру в файл в формате JSON
    let json_data = serde_json::to_string(&user).expect("Failed to serialize user");
    let mut file = File::create(&random_filename).expect("Failed to create file");
    file.write_all(json_data.as_bytes()).expect("Failed to write to file");
    
    println!("User data saved to file: {}", random_filename);
}