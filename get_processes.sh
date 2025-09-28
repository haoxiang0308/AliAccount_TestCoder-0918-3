#!/bin/bash

# Генерируем случайное имя файла
random_file_name="processes_$(date +%s%N).csv"

# Получаем список процессов и сохраняем в файл со случайным именем
# Используем ps aux и добавляем заголовки вручную
echo "USER,PID,%CPU,%MEM,VSZ,RSS,TTY,STAT,START,TIME,COMMAND" > "$random_file_name"
ps aux --no-headers | sed 's/^ *//' >> "$random_file_name"

echo "Список процессов сохранен в файл: $random_file_name"