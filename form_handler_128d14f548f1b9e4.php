<?php
// Form processing script
// This script handles form submissions, validates input, and provides feedback

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Define an array to store validation errors
$errors = [];
$data = [];

// Process form only if it's a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // Process and validate name field
    if (isset($_POST['name'])) {
        $name = trim($_POST['name']);
        if (empty($name)) {
            $errors[] = 'Name is required.';
        } elseif (strlen($name) < 2) {
            $errors[] = 'Name must be at least 2 characters long.';
        } else {
            $data['name'] = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
        }
    }
    
    // Process and validate email field
    if (isset($_POST['email'])) {
        $email = trim($_POST['email']);
        if (empty($email)) {
            $errors[] = 'Email is required.';
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errors[] = 'Email format is invalid.';
        } else {
            $data['email'] = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
        }
    }
    
    // Process and validate message field
    if (isset($_POST['message'])) {
        $message = trim($_POST['message']);
        if (empty($message)) {
            $errors[] = 'Message is required.';
        } elseif (strlen($message) > 1000) {
            $errors[] = 'Message is too long (max 1000 characters).';
        } else {
            $data['message'] = htmlspecialchars($message, ENT_QUOTES, 'UTF-8');
        }
    }
    
    // If no errors, process the form data
    if (empty($errors)) {
        // In a real application, you might save to database, send email, etc.
        $success = true;
        
        // Example: Log form submission to a file
        $log_entry = date('Y-m-d H:i:s') . " - Form submission from {$data['name']} ({$data['email']}): {$data['message']}\n";
        file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);
    }
}

// Generate a random token for CSRF protection
$csrf_token = bin2hex(random_bytes(32));
$_SESSION['csrf_token'] = $csrf_token;
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
        textarea { height: 100px; resize: vertical; }
        .error { color: #d32f2f; background-color: #ffebee; padding: 10px; border-radius: 4px; margin-bottom: 15px; }
        .success { color: #2e7d32; background-color: #e8f5e9; padding: 10px; border-radius: 4px; margin-bottom: 15px; }
        .btn { background-color: #007cba; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background-color: #005a87; }
    </style>
</head>
<body>
    <h1>Contact Form</h1>
    
    <?php if (!empty($errors)): ?>
        <div class="error">
            <p><strong>Please fix the following errors:</strong></p>
            <ul>
                <?php foreach ($errors as $error): ?>
                    <li><?php echo $error; ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <?php if (isset($success) && $success): ?>
        <div class="success">
            <p><strong>Thank you!</strong> Your form has been submitted successfully.</p>
        </div>
    <?php endif; ?>
    
    <form method="post" action="">
        <input type="hidden" name="csrf_token" value="<?php echo $csrf_token; ?>">
        
        <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" value="<?php echo isset($data['name']) ? $data['name'] : ''; ?>" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" value="<?php echo isset($data['email']) ? $data['email'] : ''; ?>" required>
        </div>
        
        <div class="form-group">
            <label for="message">Message *</label>
            <textarea id="message" name="message" required><?php echo isset($data['message']) ? $data['message'] : ''; ?></textarea>
        </div>
        
        <button type="submit" class="btn">Submit Form</button>
    </form>
    
    <div style="margin-top: 30px; padding: 15px; background-color: #f5f5f5; border-radius: 4px;">
        <h3>Form Data</h3>
        <p>This form processes the following fields:</p>
        <ul>
            <li>Name: Validates non-empty and minimum length</li>
            <li>Email: Validates format using filter_var</li>
            <li>Message: Validates non-empty and maximum length</li>
        </ul>
        <p>All input is sanitized using htmlspecialchars to prevent XSS attacks.</p>
    </div>
</body>
</html>