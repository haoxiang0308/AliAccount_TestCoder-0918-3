<?php
// Простой обработчик формы
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');

    echo "Данные получены!<br>";
    echo "Имя: " . $name . "<br>";
    echo "Email: " . $email . "<br>";
} else {
    // Вывод формы, если данные не отправлены
    echo '
    <form method="post">
        <label for="name">Имя:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <input type="submit" value="Отправить">
    </form>
    ';
}
?>