use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u8,
}

fn main() {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    // Генерация случайного (уникального) имени файла на основе текущего времени
    let time = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_nanos();
    let filename = format!("user_data_{}.txt", time);

    let mut file = File::create(&filename).expect("Could not create file");
    writeln!(file, "Name: {}", user.name).expect("Could not write name");
    writeln!(file, "Age: {}", user.age).expect("Could not write age");

    println!("User data saved to file: {}", filename);
}