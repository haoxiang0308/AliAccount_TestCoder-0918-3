<?php
/**
 * Form Processing Script
 * Handles form submission and saves data
 */

// Function to generate a random string
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process form data
    $formData = [];
    
    // Collect all form fields
    foreach ($_POST as $key => $value) {
        if (is_array($value)) {
            $formData[$key] = filter_var_array($value, FILTER_SANITIZE_STRING);
        } else {
            $formData[$key] = filter_var($value, FILTER_SANITIZE_STRING);
        }
    }
    
    // Generate a random filename for saving the data
    $randomFileName = 'form_data_' . generateRandomString() . '.txt';
    $filePath = __DIR__ . '/' . $randomFileName;
    
    // Save form data to file
    $dataToSave = "Form Submission - " . date('Y-m-d H:i:s') . "\n";
    $dataToSave .= "----------------------------------------\n";
    foreach ($formData as $field => $value) {
        if (is_array($value)) {
            $dataToSave .= "$field: " . implode(', ', $value) . "\n";
        } else {
            $dataToSave .= "$field: $value\n";
        }
    }
    $dataToSave .= "\n";
    
    // Write to file
    file_put_contents($filePath, $dataToSave, FILE_APPEND | LOCK_EX);
    
    // Return success response
    echo json_encode([
        'status' => 'success',
        'message' => 'Form submitted successfully!',
        'saved_file' => $randomFileName
    ]);
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Test Form</title>
    </head>
    <body>
        <h2>Test Form</h2>
        <form method="POST" action="">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required>
            </p>
            <p>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required>
            </p>
            <p>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message"></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    <?php
}
?>