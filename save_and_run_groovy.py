import random
import string
import subprocess

# Содержимое скрипта Groovy
groovy_script_content = '''// Замыкание для фильтрации списка чисел (например, больше 5)
def filterClosure = { list ->
    return list.findAll { it > 5 }
}

// Пример использования
def originalList = [1, 3, 6, 8, 2, 9, 0, 15]
def filteredList = filterClosure(originalList)

println "Оригинальный список: $originalList"
println "Отфильтрованный список (элементы > 5): $filteredList"
'''

# Генерация случайного имени файла
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.groovy'

# Сохранение скрипта в файл со случайным именем
with open(random_filename, 'w') as f:
    f.write(groovy_script_content)

print(f"Groovy-скрипт сохранен в файл: {random_filename}")

# Запуск скрипта с помощью groovy
result = subprocess.run(['groovy', random_filename], capture_output=True, text=True)

print("Вывод выполнения скрипта:")
print(result.stdout)
if result.stderr:
    print("Ошибки:")
    print(result.stderr)
