#!/bin/bash

# Проверяем, передан ли аргумент (имя файла для резервного копирования)
if [ $# -eq 0 ]; then
    echo "Ошибка: не указан файл для резервного копирования."
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: файл '$SOURCE_FILE' не существует."
    exit 1
fi

# Генерируем случайное имя файла для резервной копии
BACKUP_NAME=$(uuidgen)
BACKUP_FILE="$BACKUP_NAME"

# Копируем файл
cp "$SOURCE_FILE" "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Резервная копия '$SOURCE_FILE' создана с именем '$BACKUP_FILE'."
else
    echo "Ошибка при создании резервной копии."
    exit 1
fi