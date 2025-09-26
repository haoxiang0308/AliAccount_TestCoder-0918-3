import uuid
import os

# Определение путей
source_path = '/workspace/source_file.txt'

# Генерация случайного имени файла
random_file_id = str(uuid.uuid4())[:8] # Берём первые 8 символов UUID
dest_filename = f'output_file_{random_file_id}.txt'
dest_path = os.path.join('/workspace', dest_filename)

# Чтение содержимого исходного файла
with open(source_path, 'r', encoding='utf-8') as src_file:
    content = src_file.read()

# Запись содержимого в новый файл
with open(dest_path, 'w', encoding='utf-8') as dest_file:
    dest_file.write(content)

print(f"Файл скопирован в: {dest_path}")