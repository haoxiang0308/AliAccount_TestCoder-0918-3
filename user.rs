#[derive(Debug, Clone)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: "John Doe".to_string(),
        age: 30,
    };
    
    // Генерируем случайное имя файла
    use std::fs::File;
    use std::io::Write;
    use std::time::{SystemTime, UNIX_EPOCH};
    
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let filename = format!("user_data_{}.txt", timestamp);
    
    // Сохраняем данные пользователя в файл
    let mut file = File::create(&filename).expect("Не удалось создать файл");
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать имя");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать возраст");
    
    println!("Данные пользователя сохранены в файл: {}", filename);
}