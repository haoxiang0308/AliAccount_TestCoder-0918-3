#!/bin/bash

# Функция для создания резервной копии файла с случайным именем
backup_with_random_name() {
    local source_file="$1"

    # Проверяем, существует ли исходный файл
    if [[ ! -f "$source_file" ]]; then
        echo "Ошибка: Файл '$source_file' не существует."
        return 1
    fi

    # Получаем директорию, в которой находится исходный файл
    local source_dir=$(dirname "$source_file")
    # Генерируем случайное имя файла, используя uuidgen, и сохраняем его в ту же директорию
    local random_name="$source_dir/backup_$(uuidgen)_$(basename "$source_file")"

    # Копируем файл
    cp "$source_file" "$random_name"

    # Проверяем, была ли успешной операция копирования
    if [[ $? -eq 0 ]]; then
        echo "Файл успешно скопирован в: $random_name"
    else
        echo "Ошибка при копировании файла."
        return 1
    fi
}

# Проверяем, передан ли аргумент (имя файла для резервного копирования)
if [[ $# -ne 1 ]]; then
    echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
    exit 1
fi

# Вызываем функцию с аргументом командной строки
backup_with_random_name "$1"