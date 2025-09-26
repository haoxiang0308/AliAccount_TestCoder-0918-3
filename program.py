import random
import string
import os

def process_numbers(numbers):
    """Функция для обработки списка чисел: возводит в квадрат и фильтрует."""
    return [x * x for x in numbers if x * x > 10]

# Исходный список
numbers = [1, 2, 3, 4, 5, 6]
processed_numbers = process_numbers(numbers)

# Формируем строку вывода
output = f"Original: {numbers}\nProcessed: {processed_numbers}"

# Генерируем случайное имя файла
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".txt"
file_path = os.path.join(os.getcwd(), random_filename)

# Записываем в файл
with open(file_path, 'w', encoding='utf-8') as f:
    f.write(output)

print(f"Результаты записаны в файл: {file_path}")
