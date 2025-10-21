import psutil
import random

# Генерируем случайное имя файла
random_file_name = f"processes_{random.randint(1, 10000)}.txt"

# Получаем список процессов и сохраняем в файл со случайным именем
with open(random_file_name, 'w', encoding='utf-8') as f:
    for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
        try:
            f.write(f"PID: {proc.info['pid']}, Name: {proc.info['name']}, User: {proc.info['username']}, Status: {proc.info['status']}\n")
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            # Игнорируем процессы, к которым нет доступа или которые уже завершены
            pass

print(f"Список процессов сохранен в файл: {random_file_name}")