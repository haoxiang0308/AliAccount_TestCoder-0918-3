<?php
// Простой обработчик формы

// Проверяем, был ли отправлен запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Собираем данные формы
    $formData = [
        'name' => $_POST['name'] ?? '',
        'email' => $_POST['email'] ?? '',
        'message' => $_POST['message'] ?? ''
    ];

    // Простая валидация (проверим, что поля не пусты)
    $errors = [];
    if (empty($formData['name'])) {
        $errors[] = 'Имя обязательно.';
    }
    if (empty($formData['email'])) {
        $errors[] = 'Email обязателен.';
    }
    if (empty($formData['message'])) {
        $errors[] = 'Сообщение обязательно.';
    }

    if (empty($errors)) {
        // Если ошибок нет, сохраняем данные в файл
        $dataToSave = date('Y-m-d H:i:s') . " - " . json_encode($formData, JSON_UNESCAPED_UNICODE) . "\n";
        file_put_contents('form_submissions.log', $dataToSave, FILE_APPEND | LOCK_EX);
        echo "Форма успешно отправлена!";
    } else {
        // Если есть ошибки, выводим их
        foreach ($errors as $error) {
            echo $error . "<br>";
        }
    }
} else {
    // Если запрос не POST, просто выводим сообщение
    echo "Данный скрипт обрабатывает только POST-запросы.";
}
?>