/// Структура, представляющая пользователя
/// 
/// # Поля
/// * `name` - имя пользователя (строка)
/// * `age` - возраст пользователя (целое число без знака 32 бита)
#[derive(Debug, Clone)]
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    /// Создает нового пользователя с заданными именем и возрастом
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }
    
    /// Возвращает имя пользователя
    pub fn get_name(&self) -> &str {
        &self.name
    }
    
    /// Возвращает возраст пользователя
    pub fn get_age(&self) -> u32 {
        self.age
    }
}

#[cfg(test)]
mod tests {
    use super::User;

    #[test]
    fn test_user_creation() {
        let user = User::new("Алексей".to_string(), 30);
        assert_eq!(user.name, "Алексей");
        assert_eq!(user.age, 30);
    }

    #[test]
    fn test_get_name() {
        let user = User::new("Анна".to_string(), 25);
        assert_eq!(user.get_name(), "Анна");
    }

    #[test]
    fn test_get_age() {
        let user = User::new("Сергей".to_string(), 40);
        assert_eq!(user.get_age(), 40);
    }
}