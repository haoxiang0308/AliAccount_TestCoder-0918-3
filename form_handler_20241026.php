<?php
// Обработка формы и сохранение данных в файл

// Указываем путь к файлу для сохранения данных
$logFile = 'form_data_' . date('Y-m-d') . '.log';

// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Собираем данные из формы
    $formData = [];
    foreach ($_POST as $key => $value) {
        // Экранируем HTML-теги для безопасности
        $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    }

    // Формируем строку для записи в файл
    $logEntry = date('Y-m-d H:i:s') . " - " . json_encode($formData, JSON_UNESCAPED_UNICODE) . "\n";

    // Открываем файл для дозаписи и записываем данные
    if (file_put_contents($logFile, $logEntry, FILE_APPEND | LOCK_EX) !== false) {
        echo "Данные успешно сохранены.";
    } else {
        echo "Ошибка при сохранении данных.";
    }
} else {
    // Если форма не отправлена, выводим сообщение
    echo "Данные не отправлены.";
}
?>