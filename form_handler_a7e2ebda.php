<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Пример обработки данных формы
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';

    // Простая валидация
    if (!empty($name) && !empty($email) && !empty($message)) {
        // Здесь можно добавить логику для сохранения данных в файл или базу данных
        $data = "Name: $name\nEmail: $email\nMessage: $message\n------------------------\n";
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        echo "Спасибо, $name! Ваше сообщение отправлено.";
    } else {
        echo "Ошибка: Все поля обязательны для заполнения.";
    }
} else {
    // Если запрос не POST, возможно, это попытка прямого доступа к скрипту
    echo "Доступ запрещен.";
}
?>