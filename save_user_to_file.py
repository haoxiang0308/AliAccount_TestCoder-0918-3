import json
import random
import string

# Определяем "структуру" пользователя (аналог Rust-структуры)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр "структуры" с тестовыми данными
user = User("Алексей", 28)

# Генерируем случайное имя файла
random_filename = f"user_{''.join(random.choices(string.ascii_lowercase + string.digits, k=12))}.json"

# Сохраняем данные в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    json.dump({"name": user.name, "age": user.age}, f, ensure_ascii=False)

print(f"Структура Rust для пользователя сохранена в файл: {random_filename}")