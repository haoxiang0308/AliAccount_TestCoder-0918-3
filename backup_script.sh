#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан файл для резервного копирования."
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

ORIGINAL_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$ORIGINAL_FILE" ]; then
    echo "Ошибка: Файл $ORIGINAL_FILE не существует."
    exit 1
fi

# Генерируем случайное имя для резервной копии
BACKUP_NAME="backup_$(date +%s%N)_$(basename "$ORIGINAL_FILE").bak"

# Создаем резервную копию
cp "$ORIGINAL_FILE" "$BACKUP_NAME"

echo "Резервная копия файла $ORIGINAL_FILE создана как $BACKUP_NAME"