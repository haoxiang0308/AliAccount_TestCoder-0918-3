<?php
// Обработка формы и сохранение данных в файл

// Проверяем, был ли отправлен POST-запрос
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Проверяем, что обязательные поля заполнены
    if (!empty($name) && !empty($email)) {
        // Формируем строку для записи
        $data = "Имя: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Сообщение: " . $message . "\n";
        $data .= "--------------------------\n";

        // Генерируем случайное имя файла
        $random_filename = 'form_data_' . uniqid() . '.txt';

        // Пытаемся записать данные в файл
        if (file_put_contents($random_filename, $data, FILE_APPEND | LOCK_EX)) {
            echo "Данные успешно сохранены в файл: " . $random_filename;
        } else {
            echo "Ошибка при сохранении файла.";
        }
    } else {
        echo "Пожалуйста, заполните все обязательные поля (Имя и Email).";
    }
} else {
    echo "Данный скрипт обрабатывает только POST-запросы.";
}
?>