import json
import random
import string

# Определяем "структуру" пользователя (аналог Rust-структуры)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр "структуры"
user = User("John Doe", 30)

# Генерируем случайное имя файла
random_filename = f"user_data_{''.join(random.choices(string.ascii_lowercase + string.digits, k=8))}.json"

# Сохраняем данные в файл
with open(random_filename, 'w') as f:
    json.dump({"name": user.name, "age": user.age}, f)

print(f"User data saved to file: {random_filename}")