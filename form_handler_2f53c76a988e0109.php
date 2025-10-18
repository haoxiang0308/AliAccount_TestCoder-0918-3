<?php
/**
 * Form Processing Script
 * Handles form submission and processes the data
 */

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $name = isset($_POST['name']) ? htmlspecialchars(trim($_POST['name'])) : '';
    $email = isset($_POST['email']) ? htmlspecialchars(trim($_POST['email'])) : '';
    $message = isset($_POST['message']) ? htmlspecialchars(trim($_POST['message'])) : '';
    
    // Validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = "Name is required";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    if (empty($message)) {
        $errors[] = "Message is required";
    }
    
    // If no errors, process the data
    if (empty($errors)) {
        // In a real application, you would save to database or send email
        // For this example, we'll just save to a file
        $data = [
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to a log file
        $log_entry = json_encode($data) . "\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
        
        // Success response
        $result = "Form submitted successfully!<br>";
        $result .= "Name: " . $name . "<br>";
        $result .= "Email: " . $email . "<br>";
        $result .= "Message: " . $message . "<br>";
    } else {
        // Error response
        $result = "<div style='color: red;'>";
        $result .= "<h3>Errors occurred:</h3><ul>";
        foreach ($errors as $error) {
            $result .= "<li>" . $error . "</li>";
        }
        $result .= "</ul></div>";
    }
} else {
    // Default: Show the form
    $result = '';
}

// Display the form
echo "<!DOCTYPE html>
<html>
<head>
    <title>Form Processing Example</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        form { max-width: 500px; margin: 0 auto; }
        input, textarea { width: 100%; padding: 8px; margin: 5px 0; }
        input[type='submit'] { background: #007cba; color: white; border: none; cursor: pointer; }
        input[type='submit']:hover { background: #005a87; }
    </style>
</head>
<body>
    <h2>Contact Form</h2>
    <form method='POST' action='" . $_SERVER['PHP_SELF'] . "'>
        <label for='name'>Name:</label><br>
        <input type='text' id='name' name='name' required><br>
        
        <label for='email'>Email:</label><br>
        <input type='email' id='email' name='email' required><br>
        
        <label for='message'>Message:</label><br>
        <textarea id='message' name='message' rows='5' required></textarea><br>
        
        <input type='submit' value='Submit'>
    </form>
    
    <div style='margin-top: 20px;'>";
    
if (isset($result)) {
    echo $result;
}

echo "</div>
</body>
</html>";
?>