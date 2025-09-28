<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Инициализируем переменные для данных и ошибок
    $name = $email = "";
    $nameErr = $emailErr = "";

    // Обработка поля 'name'
    if (empty($_POST["name"])) {
        $nameErr = "Имя обязательно.";
    } else {
        $name = test_input($_POST["name"]);
        // Проверяем, содержит ли имя только буквы и пробелы
        if (!preg_match("/^[a-zA-Z-' ]*$/",$name)) {
            $nameErr = "Только буквы и пробелы разрешены.";
        }
    }

    // Обработка поля 'email'
    if (empty($_POST["email"])) {
        $emailErr = "Email обязателен.";
    } else {
        $email = test_input($_POST["email"]);
        // Проверяем формат email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Неверный формат email.";
        }
    }

    // Функция для проверки и очистки данных формы
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Пример обработки формы</title>
    <style>
        .error {color: #FF0000;}
    </style>
</head>
<body>

<h2>PHP Form Handling Example</h2>
<p><span class="error">* обязательное поле</span></p>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Имя: <input type="text" name="name" value="<?php echo $name;?>">
    <span class="error">* <?php echo $nameErr;?></span>
    <br><br>
    E-mail: <input type="text" name="email" value="<?php echo $email;?>">
    <span class="error">* <?php echo $emailErr;?></span>
    <br><br>
    <input type="submit" name="submit" value="Submit">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && empty($nameErr) && empty($emailErr)) {
    echo "<h2>Ваши данные:</h2>";
    echo "Имя: " . $name;
    echo "<br>";
    echo "Email: " . $email;
}
?>

</body>
</html>