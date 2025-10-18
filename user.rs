// Rust структура для пользователя с полями имя и возраст
#[derive(Debug, Clone)]
pub struct User {
    pub name: String,
    pub age: u32,
}

fn main() {
    // Создание экземпляра структуры
    let user = User {
        name: String::from("Иван"),
        age: 25,
    };
    
    // Вывод информации о пользователе
    println!("Создан пользователь: {:?}", user);
    
    // Для сохранения в файл со случайным именем понадобятся дополнительные зависимости:
    // [dependencies]
    // rand = "0.8"
    // serde = { version = "1.0", features = ["derive"] }
    // serde_json = "1.0"
    
    /*
    // Пример кода для сохранения в файл (требует указанные зависимости):
    use std::fs::File;
    use std::io::Write;
    use rand::Rng;
    
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    let json_data = serde_json::to_string(&user).unwrap();
    let mut file = File::create(&random_filename).unwrap();
    file.write_all(json_data.as_bytes()).unwrap();
    
    println!("Данные пользователя сохранены в файл: {}", random_filename);
    */
}