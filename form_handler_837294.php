<?php
// Обработка формы
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Простая валидация и экранирование данных
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $message = htmlspecialchars($_POST['message'] ?? '');

    // Проверка на заполнение обязательных полей
    if (!empty($name) && !empty($email) && !empty($message)) {
        // Запись данных в файл
        $data = "Имя: $name\nEmail: $email\nСообщение: $message\n------------------------\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);
        echo "Данные успешно сохранены!";
    } else {
        echo "Пожалуйста, заполните все поля формы.";
    }
} else {
    echo "Доступ запрещен.";
}
?>