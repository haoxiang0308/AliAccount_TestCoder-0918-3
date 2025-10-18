<?php
/**
 * Form Processing Script
 * Handles form submission with validation and sanitization
 */

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Initialize variables
    $name = $email = $message = "";
    $nameErr = $emailErr = $messageErr = "";
    $isValid = true;
    
    // Process Name
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
        $isValid = false;
    } else {
        $name = sanitizeInput($_POST["name"]);
        // Check if name only contains letters and whitespace
        if (!preg_match("/^[a-zA-Z-' ]*$/", $name)) {
            $nameErr = "Only letters and white space allowed";
            $isValid = false;
        }
    }
    
    // Process Email
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
        $isValid = false;
    } else {
        $email = sanitizeInput($_POST["email"]);
        // Check if email is valid
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
            $isValid = false;
        }
    }
    
    // Process Message
    if (empty($_POST["message"])) {
        $messageErr = "Message is required";
        $isValid = false;
    } else {
        $message = sanitizeInput($_POST["message"]);
    }
    
    // If all data is valid, process the form
    if ($isValid) {
        // Here you could save to database, send email, etc.
        $submission_time = date("Y-m-d H:i:s");
        
        // Example: Save to a file (in a real application, you'd likely use a database)
        $data = "Name: $name\n";
        $data .= "Email: $email\n";
        $data .= "Message: $message\n";
        $data .= "Submitted at: $submission_time\n";
        $data .= "-------------------------\n";
        
        file_put_contents("form_submissions.txt", $data, FILE_APPEND | LOCK_EX);
        
        echo "<h2>Form Submitted Successfully!</h2>";
        echo "<p>Thank you for your submission, $name.</p>";
        echo "<p>We will contact you at $email.</p>";
    } else {
        // Display errors
        echo "<h2>Form Submission Failed</h2>";
        echo "<p>Please correct the following errors:</p>";
        echo "<ul>";
        if (!empty($nameErr)) echo "<li>Name: $nameErr</li>";
        if (!empty($emailErr)) echo "<li>Email: $emailErr</li>";
        if (!empty($messageErr)) echo "<li>Message: $messageErr</li>";
        echo "</ul>";
        
        // Show a link to go back to the form
        echo '<a href="#" onclick="window.history.back();">Go back to form</a>';
    }
} else {
    // If accessed directly without POST, show an error
    echo "<h2>Access Denied</h2>";
    echo "<p>You cannot access this page directly.</p>";
}
?>