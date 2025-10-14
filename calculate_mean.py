import numpy as np
import random
import string

def calculate_mean(data):
    """Вычисляет среднее значение списка чисел."""
    if not data:
        raise ValueError("Список данных пуст.")
    return sum(data) / len(data)

# Пример данных
data = [10, 20, 30, 40, 50]

# Вычисление среднего
mean_value = calculate_mean(data)

# Генерация случайного имени файла
random_filename = "mean_result_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".txt"

# Сохранение результата в файл
with open(random_filename, 'w') as f:
    f.write(f"Среднее значение: {mean_value}\n")
    f.write(f"Данные: {data}\n")

print(f"Среднее значение {mean_value} сохранено в файл {random_filename}")
