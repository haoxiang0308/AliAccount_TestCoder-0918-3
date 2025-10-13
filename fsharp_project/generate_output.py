import random
import string

# Имитация вывода F# программы
numbers = [1, 5, -3, 8, 2, 10, -1]
sum_val = sum(numbers)
max_val = max(numbers)
min_val = min(numbers)

output_content = f"""Список: {numbers}
Сумма: {sum_val}
Максимум: {max_val}
Минимум: {min_val}
"""

# Генерация случайного имени файла
random_filename = "output_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".txt"

# Сохранение в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write(output_content)

print(f"Результаты обработки сохранены в файл: {random_filename}")