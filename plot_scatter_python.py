import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Генерация случайных данных
n = 100
x = np.random.normal(loc=50, scale=15, size=n)
y = np.random.normal(loc=50, scale=15, size=n)

# Создание диаграммы рассеяния
plt.figure(figsize=(8, 6))
plt.scatter(x, y, alpha=0.7)
plt.title('Scatter Plot')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.grid(True)

# Генерация случайного имени файла
random_name = "scatter_plot_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".png"

# Сохранение графика в файл
plt.savefig(random_name)
print(f"Scatter plot saved to file: {random_name}")