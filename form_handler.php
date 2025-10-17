<?php
// PHP script to handle form processing
// This script demonstrates processing a simple contact form

// Set content type to HTML
header('Content-Type: text/html; charset=utf-8');

// Define function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form data
    $name = isset($_POST['name']) ? sanitizeInput($_POST['name']) : '';
    $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : '';
    $message = isset($_POST['message']) ? sanitizeInput($_POST['message']) : '';
    
    // Basic validation
    $errors = array();
    
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
    
    // If no errors, process the data (in this example we'll just display it)
    if (empty($errors)) {
        // In a real application, you would save to database, send email, etc.
        
        // Display success message
        echo "<!DOCTYPE html>";
        echo "<html>";
        echo "<head><title>Form Submission Result</title></head>";
        echo "<body>";
        echo "<h2>Form Submitted Successfully</h2>";
        echo "<p><strong>Name:</strong> " . $name . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
        echo "<p><strong>Message:</strong> " . $message . "</p>";
        
        // Log the submission to a file (optional)
        $logData = date('Y-m-d H:i:s') . " - Name: " . $name . ", Email: " . $email . ", Message: " . $message . "\n";
        file_put_contents("form_submissions.log", $logData, FILE_APPEND | LOCK_EX);
        
        echo "<p>Your form has been submitted successfully!</p>";
        echo "<a href=''>Submit another form</a>";
        echo "</body>";
        echo "</html>";
    } else {
        // Display errors
        echo "<!DOCTYPE html>";
        echo "<html>";
        echo "<head><title>Form Errors</title></head>";
        echo "<body>";
        echo "<h2>Please fix the following errors:</h2>";
        echo "<ul>";
        foreach ($errors as $error) {
            echo "<li>" . $error . "</li>";
        }
        echo "</ul>";
        echo "<a href=''>Go back to form</a>";
        echo "</body>";
        echo "</html>";
    }
} else {
    // Display the form if not submitted
    echo "<!DOCTYPE html>";
    echo "<html>";
    echo "<head><title>Contact Form</title></head>";
    echo "<body>";
    echo "<h2>Contact Form</h2>";
    echo "<form method='post' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "'>";
    echo "<p><label for='name'>Name:</label><br>";
    echo "<input type='text' id='name' name='name' required></p>";
    
    echo "<p><label for='email'>Email:</label><br>";
    echo "<input type='email' id='email' name='email' required></p>";
    
    echo "<p><label for='message'>Message:</label><br>";
    echo "<textarea id='message' name='message' rows='5' cols='40' required></textarea></p>";
    
    echo "<p><input type='submit' value='Submit'></p>";
    echo "</form>";
    echo "</body>";
    echo "</html>";
}
?>