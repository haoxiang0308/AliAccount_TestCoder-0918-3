import random
import string
import os

# Определение "структуры" пользователя
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создание экземпляра пользователя
user = User("Иван", 30)

# Генерация случайного имени файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".txt"

# Запись данных пользователя в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write(f"name: {user.name}, age: {user.age}")

print(f"Структура пользователя сохранена в файл: {random_filename}")