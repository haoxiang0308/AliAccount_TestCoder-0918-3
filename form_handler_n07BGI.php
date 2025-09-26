<?php
// Обработка формы

// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Извлекаем данные из формы
    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);

    // Здесь можно добавить валидацию и сохранение в базу данных
    // ...

    // Выводим полученные данные (для демонстрации)
    echo "<h1>Данные формы получены!</h1>";
    echo "<p><strong>Имя:</strong> " . $name . "</p>";
    echo "<p><strong>Email:</strong> " . $email . "</p>";
} else {
    // Если запрос не POST, отображаем форму
    echo '
    <form method="post" action="">
        <label for="name">Имя:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <input type="submit" value="Отправить">
    </form>
    ';
}
?>