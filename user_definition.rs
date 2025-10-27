// Определение структуры User с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

// Пример создания экземпляра структуры
fn main() {
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Создан пользователь: {}, возраст: {}", user.name, user.age);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_user_creation() {
        let user = User {
            name: String::from("Анна"),
            age: 25,
        };
        
        assert_eq!(user.name, "Анна");
        assert_eq!(user.age, 25);
    }
}