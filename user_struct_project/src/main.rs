use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;

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

    // Генерируем "случайное" имя файла
    let random_filename = format!("user_data_{}.json", 12345); // Вместо настоящего случайного числа используем 12345

    let json_string = serde_json::to_string(&user)?;
    let mut file = File::create(&random_filename)?;
    file.write_all(json_string.as_bytes())?;

    println!("User data saved to file: {}", random_filename);
    Ok(())
}