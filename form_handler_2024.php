<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Функция для очистки и проверки входных данных
    function test_input($data) {
        $data = trim($data); // Удаляем пробелы
        $data = stripslashes($data); // Удаляем экранирование
        $data = htmlspecialchars($data); // Преобразуем специальные символы в HTML сущности
        return $data;
    }

    // Получаем и проверяем имя
    $name = $error_name = "";
    if (isset($_POST["name"])) {
        $name = test_input($_POST["name"]);
        if (empty($name)) {
            $error_name = "Имя обязательно.";
        }
    }

    // Получаем и проверяем email
    $email = $error_email = "";
    if (isset($_POST["email"])) {
        $email = test_input($_POST["email"]);
        if (empty($email)) {
            $error_email = "Email обязателен.";
        } else {
            // Проверяем формат email
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $error_email = "Неверный формат email.";
            }
        }
    }

    // Получаем и проверяем комментарий
    $comment = $error_comment = "";
    if (isset($_POST["comment"])) {
        $comment = test_input($_POST["comment"]);
    }

    // Если ошибок нет, сохраняем данные в файл
    if (empty($error_name) && empty($error_email)) {
        $filename = "form_data.txt";
        $entry = "Имя: " . $name . "\nEmail: " . $email . "\nКомментарий: " . $comment . "\n---\n";
        
        // Открываем файл для добавления данных (или создаем, если его нет)
        $file = fopen($filename, "a");
        if ($file) {
            fwrite($file, $entry);
            fclose($file);
            $success_message = "Данные успешно сохранены!";
        } else {
            $error_general = "Ошибка при сохранении данных.";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Обработка формы</title>
    <style>
        .error { color: #FF0000; }
        .success { color: #008000; }
    </style>
</head>
<body>

<?php if (isset($success_message)): ?>
    <p class="success"><?php echo $success_message;?></p>
<?php endif; ?>

<?php if (isset($error_general)): ?>
    <p class="error"><?php echo $error_general;?></p>
<?php endif; ?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Имя: <input type="text" name="name" value="<?php echo $name;?>">
    <span class="error">* <?php echo $error_name;?></span>
    <br><br>
    E-mail: <input type="text" name="email" value="<?php echo $email;?>">
    <span class="error">* <?php echo $error_email;?></span>
    <br><br>
    Комментарий: <textarea name="comment" rows="5" cols="40"><?php echo $comment;?></textarea>
    <br><br>
    <input type="submit" name="submit" value="Отправить">
</form>

</body>
</html>