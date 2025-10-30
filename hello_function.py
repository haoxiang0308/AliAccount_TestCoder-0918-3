import uuid

def hello_world():
    print('Привет, мир!')

# Генерация случайного имени файла
random_filename = f'hello_script_{uuid.uuid4().hex}.py'

# Запись функции в файл со случайным именем
with open(random_filename, 'w', encoding='utf-8') as file:
    file.write("def hello_world():\n    print('Привет, мир!')\n\n# Вызов функции\nhello_world()\n")

print(f'Функция сохранена в файл: {random_filename}')