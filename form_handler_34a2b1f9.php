<?php
// Обработка формы и сохранение данных в файл

// Указываем директорию для сохранения файлов
$uploadDir = __DIR__ . '/uploads/';

// Создаем директорию, если она не существует
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0755, true);
}

// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (можно расширить)
    if (!empty($name) && !empty($email)) {
        // Подготавливаем данные для записи
        $data = "Имя: " . htmlspecialchars($name) . "\n";
        $data .= "Email: " . htmlspecialchars($email) . "\n";
        $data .= "Дата отправки: " . date('Y-m-d H:i:s') . "\n---\n";

        // Генерируем случайное имя файла
        $randomFileName = $uploadDir . uniqid('form_data_', true) . '.txt';

        // Сохраняем данные в файл
        if (file_put_contents($randomFileName, $data)) {
            echo "Данные успешно сохранены в файл: " . basename($randomFileName);
        } else {
            echo "Ошибка при сохранении файла.";
        }
    } else {
        echo "Пожалуйста, заполните все поля формы.";
    }
} else {
    // Если форма не отправлена, выводим HTML-форму
    ?>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Форма</title>
    </head>
    <body>
        <h2>Отправить данные</h2>
        <form method="post">
            <label for="name">Имя:</label>
            <input type="text" id="name" name="name" required><br><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            <button type="submit">Отправить</button>
        </form>
    </body>
    </html>
    <?php
}
?>