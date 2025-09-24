<?php
// Простой обработчик формы

// Установим заголовок ответа в формате HTML
header('Content-Type: text/html; charset=utf-8');

// Функция для проверки и очистки данных
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Проверим, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Сбор данных из формы
    $name = $email = $comment = "";
    $name_err = $email_err = "";

    if (isset($_POST["name"])) {
        $name = sanitize_input($_POST["name"]);
        if (empty($name)) {
            $name_err = "Имя обязательно.";
        }
    }

    if (isset($_POST["email"])) {
        $email = sanitize_input($_POST["email"]);
        if (empty($email)) {
            $email_err = "Email обязателен.";
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $email_err = "Неверный формат email.";
        }
    }

    if (isset($_POST["comment"])) {
        $comment = sanitize_input($_POST["comment"]);
    }

    // Если ошибок нет, выведем данные
    if (empty($name_err) && empty($email_err)) {
        echo "<h2>Данные формы успешно обработаны!</h2>";
        echo "<p><strong>Имя:</strong> " . $name . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
        echo "<p><strong>Комментарий:</strong> " . $comment . "</p>";
    } else {
        // Выведем ошибки
        echo "<h2>Ошибка в данных формы:</h2>";
        if (!empty($name_err)) {
            echo "<p><strong>Имя:</strong> " . $name_err . "</p>";
        }
        if (!empty($email_err)) {
            echo "<p><strong>Email:</strong> " . $email_err . "</p>";
        }
    }
} else {
    // Если не POST, просто выведем сообщение
    echo "Для доступа к этому скрипту используйте POST-запрос.";
}
?>