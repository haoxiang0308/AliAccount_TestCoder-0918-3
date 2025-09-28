#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Использование: $0 <имя_файла_для_резервного_копирования>"
  exit 1
fi

# Оригинальный файл
original_file="$1"

# Проверяем, существует ли файл
if [ ! -f "$original_file" ]; then
  echo "Ошибка: файл $original_file не существует."
  exit 1
fi

# Генерируем случайное имя для резервной копии
backup_name=$(uuidgen)

# Создаем резервную копию
cp "$original_file" "$backup_name"

echo "Резервная копия файла '$original_file' создана с именем '$backup_name'."