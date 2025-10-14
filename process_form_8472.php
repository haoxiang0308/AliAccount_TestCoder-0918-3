<?php
// Обработчик формы
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Пример обработки данных
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);

    // Логика обработки (например, сохранение в файл или базу данных)
    $data = "Имя: $name, Email: $email\n";
    file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

    echo "Данные успешно сохранены!";
} else {
    // Если GET-запрос, возможно, показать форму (упрощённо)
    echo "Метод запроса не POST.";
}
?>