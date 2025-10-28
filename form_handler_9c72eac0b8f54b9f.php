<?php
/**
 * Form Processing Script
 * Handles form submissions with validation and sanitization
 */

// Set content type
header('Content-Type: text/html; charset=utf-8');

// Define allowed methods
$allowedMethods = ['GET', 'POST'];
if (!in_array($_SERVER['REQUEST_METHOD'], $allowedMethods)) {
    http_response_code(405);
    die('Method not allowed');
}

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to validate email
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Function to validate required fields
function validateRequired($value) {
    return !empty(trim($value));
}

// Process form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect and sanitize form data
    $name = sanitizeInput($_POST['name'] ?? '');
    $email = sanitizeInput($_POST['email'] ?? '');
    $message = sanitizeInput($_POST['message'] ?? '');
    $subject = sanitizeInput($_POST['subject'] ?? '');
    
    // Validation flags
    $errors = [];
    
    // Validate required fields
    if (!validateRequired($name)) {
        $errors[] = 'Name is required';
    }
    
    if (!validateRequired($email)) {
        $errors[] = 'Email is required';
    } elseif (!validateEmail($email)) {
        $errors[] = 'Invalid email format';
    }
    
    if (!validateRequired($message)) {
        $errors[] = 'Message is required';
    }
    
    // If no errors, process the form
    if (empty($errors)) {
        // Here you could save to database, send email, etc.
        // For this example, we'll just save to a file
        $formData = [
            'name' => $name,
            'email' => $email,
            'subject' => $subject,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];
        
        // Save to file (in a real application, you'd use a database)
        $logFile = 'form_submissions.json';
        $existingData = [];
        
        if (file_exists($logFile)) {
            $existingData = json_decode(file_get_contents($logFile), true) ?: [];
        }
        
        $existingData[] = $formData;
        file_put_contents($logFile, json_encode($existingData, JSON_PRETTY_PRINT));
        
        // Success response
        $successMessage = 'Form submitted successfully!';
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Handler</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        textarea { height: 100px; }
        button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .error { color: red; margin-bottom: 10px; }
        .success { color: green; margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if (isset($errors) && !empty($errors)): ?>
        <div class="error">
            <h3>Validation Errors:</h3>
            <ul>
                <?php foreach ($errors as $error): ?>
                    <li><?php echo htmlspecialchars($error); ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <?php if (isset($successMessage)): ?>
        <div class="success">
            <p><?php echo htmlspecialchars($successMessage); ?></p>
        </div>
    <?php endif; ?>
    
    <form method="post" action="">
        <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>
        </div>
        
        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" value="<?php echo isset($_POST['subject']) ? htmlspecialchars($_POST['subject']) : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="message">Message *</label>
            <textarea id="message" name="message" required><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
        </div>
        
        <button type="submit">Submit</button>
    </form>
    
    <p><small>Fields marked with * are required</small></p>
</body>
</html>
