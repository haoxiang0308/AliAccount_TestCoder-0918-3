import json
import random
import string

# Определяем структуру данных пользователя, аналогичную Rust-структуре
user_data = {
    "name": "John Doe",  # поле имени
    "age": 30            # поле возраста
}

# Генерируем случайное имя файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".json"

# Сохраняем данные в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    json.dump(user_data, f, ensure_ascii=False, indent=2)

print(f"User data saved to file: {random_filename}")