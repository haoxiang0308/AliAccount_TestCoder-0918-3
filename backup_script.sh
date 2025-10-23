#!/bin/bash

# Функция для создания резервной копии файла с случайным именем
create_backup() {
    local source_file="$1"
    
    # Проверяем, существует ли файл
    if [[ ! -f "$source_file" ]]; then
        echo "Ошибка: Файл $source_file не существует."
        exit 1
    fi
    
    # Генерируем случайное имя для резервной копии
    local random_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    local backup_name="/workspace/${random_name}"
    
    # Создаем копию файла
    cp "$source_file" "$backup_name"
    
    echo "Резервная копия файла $source_file создана как $backup_name"
}

# Проверяем, передан ли аргумент
if [[ $# -eq 0 ]]; then
    echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
    exit 1
fi

# Вызываем функцию создания резервной копии
create_backup "$1"