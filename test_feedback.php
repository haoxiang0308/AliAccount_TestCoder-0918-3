#!/usr/bin/env php
<?php
// Симуляция данных формы
$_SERVER["REQUEST_METHOD"] = "POST";
$_POST['name'] = "Иван Иванов";
$_POST['email'] = "ivan@example.com";
$_POST['message'] = "Это тестовое сообщение для проверки работы скрипта.";

// Подключаем основной скрипт обработки
include 'process_feedback.php';

// Проверяем, что данные были записаны в файл
if (file_exists('feedback.txt')) {
    echo "Данные успешно записаны в файл feedback.txt\n";
    echo "Содержимое файла:\n";
    echo file_get_contents('feedback.txt');
} else {
    echo "Файл feedback.txt не был создан.\n";
}
?>