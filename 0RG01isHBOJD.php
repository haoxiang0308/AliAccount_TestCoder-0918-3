<?php
// Обработка формы
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');

    echo "<h2>Данные формы:</h2>";
    echo "<p><strong>Имя:</strong> $name</p>";
    echo "<p><strong>Email:</strong> $email</p>";
} else {
    // Вывод формы, если данные не отправлены
    echo '<form method="post">
            <label for="name">Имя:</label>
            <input type="text" id="name" name="name" required><br><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            <input type="submit" value="Отправить">
          </form>';
}
?>