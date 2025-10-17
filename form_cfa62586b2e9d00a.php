<?php
/**
 * Form Processing Script
 * Handles form submission and saves data to a file
 */

// Function to generate a random filename
function generateRandomFileName($extension = 'txt') {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < 10; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString . '.' . $extension;
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $formData = [];
    
    // Process each form field
    foreach ($_POST as $key => $value) {
        // Sanitize input data
        $formData[$key] = htmlspecialchars(strip_tags(trim($value)));
    }
    
    // Generate a random filename
    $randomFileName = generateRandomFileName('txt');
    $filePath = __DIR__ . '/' . $randomFileName;
    
    // Prepare data to save
    $output = "Form Submission Data:\n";
    $output .= "Submitted at: " . date('Y-m-d H:i:s') . "\n";
    $output .= "------------------------\n";
    
    foreach ($formData as $field => $value) {
        $output .= "$field: $value\n";
    }
    
    $output .= "\n";
    
    // Save form data to file with random name
    if (file_put_contents($filePath, $output)) {
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Data saved to file: <strong>$randomFileName</strong></p>";
        echo "<p>File contents:</p><pre>$output</pre>";
    } else {
        echo "<h2>Error saving form data!</h2>";
        echo "<p>Could not save data to file.</p>";
    }
} else {
    // Display a simple form for testing
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Form Processing Example</title>
    </head>
    <body>
        <h1>Sample Form</h1>
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
                <textarea id="message" name="message" rows="5" cols="40"></textarea>
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