#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: не указан файл для резервного копирования."
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

# Путь к исходному файлу
SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: файл $SOURCE_FILE не существует."
    exit 1
fi

# Имя исходного файла без пути
BASENAME=$(basename "$SOURCE_FILE")

# Генерируем случайное имя для файла резервной копии
# Используем формат backup_имяфайла_дата_рандомноевремя.tar.gz
BACKUP_NAME="backup_${BASENAME}_$(date +%Y%m%d_%H%M%S)_$(shuf -i 1000-9999 -n 1).tar.gz"

# Путь для сохранения резервной копии (в текущей директории)
BACKUP_PATH="./$BACKUP_NAME"

# Создаем резервную копию с помощью tar
tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_FILE")" "$BASENAME"

# Проверяем, успешно ли создана резервная копия
if [ $? -eq 0 ]; then
    echo "Резервная копия успешно создана: $BACKUP_PATH"
else
    echo "Ошибка при создании резервной копии."
    exit 1
fi