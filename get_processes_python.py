import psutil
import random
import string

def generate_random_filename():
    # Генерируем случайное имя файла
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"processes_{random_string}.txt"

def get_processes_and_save():
    # Получаем список процессов
    processes = psutil.process_iter(['pid', 'name', 'username'])
    
    # Генерируем случайное имя файла
    filename = generate_random_filename()
    
    # Сохраняем список процессов в файл
    with open(filename, 'w', encoding='utf-8') as file:
        for process in processes:
            try:
                file.write(f"PID: {process.info['pid']}, Name: {process.info['name']}, User: {process.info['username']}\n")
            except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                # Игнорируем процессы, к которым нет доступа
                pass
    
    print(f"Список процессов сохранен в файл: {filename}")

if __name__ == "__main__":
    get_processes_and_save()