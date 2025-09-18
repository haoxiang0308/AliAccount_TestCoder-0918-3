<?php
// PHP скрипт для обработки формы
// Файл: yRP2R3JsX8.php

// Проверяем, была ли отправлена форма методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST["name"]));
    $email = htmlspecialchars(trim($_POST["email"]));
    $message = htmlspecialchars(trim($_POST["message"]));
    
    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Пожалуйста, заполните все поля формы.";
        exit;
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Некорректный адрес электронной почты.";
        exit;
    }
    
    // Формируем строку для сохранения
    $data = "Имя: $name\nEmail: $email\nСообщение: $message\n\n";
    
    // Имя файла для сохранения данных
    $outputFile = "form_submissions.txt";
    
    // Пытаемся сохранить данные в файл
    if (file_put_contents($outputFile, $data, FILE_APPEND | LOCK_EX)) {
        echo "Спасибо! Ваше сообщение успешно отправлено и сохранено.";
    } else {
        echo "Произошла ошибка при сохранении данных.";
    }
} else {
    // Если скрипт вызван не методом POST, перенаправляем на index.html
    header("Location: index.html");
    exit;
}
?>