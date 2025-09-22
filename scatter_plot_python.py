import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Генерация случайных данных
np.random.seed(123)  # Для воспроизводимости
x = np.random.normal(50, 10, 100)
y = 2 * x + np.random.normal(0, 5, 100)

# Создание диаграммы рассеяния
plt.figure(figsize=(10, 6))
plt.scatter(x, y, color='blue', alpha=0.7)

# Добавление линии регрессии
coefficients = np.polyfit(x, y, 1)
polynomial = np.poly1d(coefficients)
x_line = np.linspace(x.min(), x.max(), 100)
y_line = polynomial(x_line)
plt.plot(x_line, y_line, color='red', linewidth=2)

# Настройка графика
plt.title('Диаграмма рассеяния')
plt.xlabel('X переменная')
plt.ylabel('Y переменная')
plt.grid(True, alpha=0.3)

# Генерация случайного имени файла
random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
filename = f'scatter_plot_{random_suffix}.png'

# Сохранение графика
plt.savefig(filename)
plt.close()

print(f"График сохранен в файл: {filename}")