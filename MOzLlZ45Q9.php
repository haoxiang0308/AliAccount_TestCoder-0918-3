<?php
// Скрипт для обработки формы
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Пожалуйста, заполните все поля.";
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Неверный формат email.";
        exit;
    }

    // Подготавливаем данные для сохранения
    $data = "Имя: $name\nEmail: $email\nСообщение: $message\n\n";

    // Имя файла для сохранения данных
    $filename = "form_submissions.txt";

    // Сохраняем данные в файл (добавляем в конец)
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Спасибо! Ваши данные успешно сохранены.";
    } else {
        echo "Ошибка при сохранении данных.";
    }
} else {
    // Если форма не была отправлена, показываем форму
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма обратной связи</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Форма обратной связи</h2>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
            
            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    <?php
}
?>