use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
use serde_json;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> std::io::Result<()> {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    // Генерируем случайное имя файла
    let random_filename = format!("user_data_{}.json", rand::random::<u32>());
    let json_string = serde_json::to_string(&user).unwrap();

    let mut file = File::create(&random_filename)?;
    file.write_all(json_string.as_bytes())?;
    file.flush()?;

    println!("Структура пользователя сохранена в файл: {}", random_filename);
    Ok(())
}