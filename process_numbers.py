import random
import string

def process_numbers(numbers):
    """Функция для обработки списка чисел: оставить положительные, возвести в квадрат, отсортировать."""
    return sorted([x**2 for x in numbers if x > 0])

def generate_random_filename(extension="txt"):
    """Генерирует случайное имя файла с заданным расширением."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"processed_numbers_{random_string}.{extension}"

# Входной список
numbers = [-2, 5, -1, 3, 8, 0, 4]
processed_numbers = process_numbers(numbers)

print(f"Исходный список: {numbers}")
print(f"Обработанный список: {processed_numbers}")

# Генерация случайного имени файла и сохранение результатов
random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(f"Исходный список: {numbers}\n")
    f.write(f"Обработанный список: {processed_numbers}\n")

print(f"Результаты сохранены в файл: {random_filename}")
