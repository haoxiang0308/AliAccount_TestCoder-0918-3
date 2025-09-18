<?php
// Проверяем, была ли отправлена форма методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));
    
    // Валидация данных
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Имя обязательно для заполнения.";
    }
    
    if (empty($email)) {
        $errors[] = "Email обязателен для заполнения.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Неверный формат email.";
    }
    
    if (empty($message)) {
        $errors[] = "Сообщение обязательно для заполнения.";
    }
    
    // Если нет ошибок, сохраняем данные
    if (empty($errors)) {
        // Формируем строку для записи в файл
        $data = "Имя: $name\nEmail: $email\nСообщение: $message\nДата: " . date("Y-m-d H:i:s") . "\n\n";
        
        // Имя файла для сохранения данных
        $filename = "form_submissions.txt";
        
        // Записываем данные в файл
        if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
            echo "<h2>Спасибо!</h2>";
            echo "<p>Ваше сообщение успешно отправлено.</p>";
            echo "<p><a href='test_form.html'>Вернуться к форме</a></p>";
        } else {
            echo "<h2>Ошибка!</h2>";
            echo "<p>Не удалось сохранить данные. Попробуйте позже.</p>";
        }
    } else {
        // Отображаем ошибки
        echo "<h2>Ошибка!</h2>";
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>$error</li>";
        }
        echo "</ul>";
        echo "<p><a href='test_form.html'>Вернуться к форме</a></p>";
    }
} else {
    // Если форма не была отправлена, перенаправляем на форму
    header("Location: test_form.html");
    exit();
}
?>