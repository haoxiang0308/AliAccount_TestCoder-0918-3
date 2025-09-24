// Определение структуры пользователя
#[derive(Debug)]
pub struct User {
    pub name: String,
    pub age: u32,
}

// Пример использования
fn main() {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    println!("User: {:?}", user);
}