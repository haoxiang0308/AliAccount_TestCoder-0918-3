<?php
// Обработка формы при отправке методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Сбор данных из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (в реальном приложении нужна более строгая валидация)
    if (!empty($name) && !empty($email)) {
        // Логирование данных в файл (например, для архивации)
        $log_entry = date('Y-m-d H:i:s') . " - Имя: $name, Email: $email, Сообщение: $message\n";
        file_put_contents('/workspace/form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);

        // Отправка ответа пользователю
        echo "<h1>Спасибо за ваше сообщение!</h1>";
        echo "<p>Имя: " . htmlspecialchars($name) . "</p>";
        echo "<p>Email: " . htmlspecialchars($email) . "</p>";
        echo "<p>Сообщение: " . htmlspecialchars($message) . "</p>";
    } else {
        echo "<h1>Ошибка: Пожалуйста, заполните обязательные поля (Имя и Email).</h1>";
    }
} else {
    // Если форма не отправлена, показать саму форму
    echo '
    <form method="post" action="">
        <label for="name">Имя (обязательно):</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email (обязательно):</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="message">Сообщение:</label><br>
        <textarea id="message" name="message"></textarea><br><br>

        <input type="submit" value="Отправить">
    </form>
    ';
}
?>