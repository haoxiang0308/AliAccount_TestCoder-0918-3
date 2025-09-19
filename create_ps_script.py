import random
import string
import os

# 1. Определяем содержимое скрипта Bash
ps_script_content = "ps aux"

# 2. Генерируем случайные имена файлов
def random_filename(prefix, extension):
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{prefix}_{random_chars}.{extension}"

script_filename = random_filename("script", "sh")
output_filename = random_filename("output", "txt")

# 3. Создаем файл скрипта и записываем в него содержимое
with open(script_filename, 'w') as f:
    f.write(ps_script_content)

print(f"Скрипт PowerShell создан: {script_filename}")
print(f"Файл для вывода: {output_filename}")

# 4. Формируем команду Bash
ps_command = f"bash ./{script_filename} > ./{output_filename}"

# 5. Выводим команду для последующего выполнения в bash
print(f"PS_COMMAND::{ps_command}")