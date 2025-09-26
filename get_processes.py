import subprocess
import random
import string

# Генерируем случайное имя файла
random_filename = "processes_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".txt"

# Выполняем команду для получения списка процессов (аналог Get-Process)
result = subprocess.run(['ps', 'aux'], capture_output=True, text=True)

# Сохраняем вывод в файл
with open(random_filename, 'w') as f:
    f.write(result.stdout)

print(f"Список процессов сохранен в файл: {random_filename}")