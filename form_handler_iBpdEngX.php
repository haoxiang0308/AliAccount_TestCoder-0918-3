<?php
// Проверяем, была ли отправлена форма
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы
    $name = isset($_POST["name"]) ? htmlspecialchars($_POST["name"]) : "";
    $email = isset($_POST["email"]) ? htmlspecialchars($_POST["email"]) : "";
    $message = isset($_POST["message"]) ? htmlspecialchars($_POST["message"]) : "";
    
    // Простая валидация
    if (empty($name) || empty($email) || empty($message)) {
        echo "Пожалуйста, заполните все поля формы.";
    } else {
        // Обработка данных (в данном случае просто выводим их)
        echo "Форма успешно отправлена!<br>";
        echo "Имя: " . $name . "<br>";
        echo "Email: " . $email . "<br>";
        echo "Сообщение: " . $message . "<br>";
        
        // Здесь можно добавить сохранение в файл или базу данных
        $logEntry = date("Y-m-d H:i:s") . " - Имя: $name, Email: $email, Сообщение: $message" . PHP_EOL;
        file_put_contents("form_submissions.log", $logEntry, FILE_APPEND);
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