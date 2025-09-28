import random
import string
import json

# Определение "структуры" точки с помощью словаря
point = {
    "x": 10.5,
    "y": 20.3,
    "id": "point_A"
}

# Генерация случайного имени файла
random_filename = "point_data_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".json"

# Сохранение информации о точке в файл
with open(random_filename, 'w') as f:
    json.dump(point, f)

print(f"Информация о точке сохранена в файл {random_filename}")