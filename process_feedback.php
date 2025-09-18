<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы и очищаем их
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';
    
    // Проверяем, что все поля заполнены
    if (empty($name) || empty($email) || empty($message)) {
        $error = "Пожалуйста, заполните все поля формы.";
    } 
    // Проверяем корректность email
    elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Пожалуйста, введите корректный email адрес.";
    } 
    else {
        // Все данные корректны, сохраняем их в файл
        
        // Создаем строку с данными
        $data = "Имя: $name\n";
        $data .= "Email: $email\n";
        $data .= "Сообщение: $message\n";
        $data .= "Дата: " . date("Y-m-d H:i:s") . "\n";
        $data .= str_repeat("-", 40) . "\n";
        
        // Имя файла для сохранения данных
        $filename = "feedback.txt";
        
        // Пытаемся сохранить данные в файл
        if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
            $success = "Спасибо! Ваше сообщение успешно отправлено.";
        } else {
            $error = "Произошла ошибка при сохранении данных. Пожалуйста, попробуйте позже.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Результат отправки формы</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <?php if (isset($success)): ?>
            <div class="message success">
                <?php echo htmlspecialchars($success); ?>
            </div>
        <?php elseif (isset($error)): ?>
            <div class="message error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>
        
        <a href="feedback_form.html" class="back-link">Вернуться к форме</a>
    </div>
</body>
</html>