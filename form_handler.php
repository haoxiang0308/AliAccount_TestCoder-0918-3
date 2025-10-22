<?php
// PHP script for form processing

// Function to generate a random filename
function generateRandomFilename($extension = 'php') {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < 10; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString . '.' . $extension;
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect form data
    $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $message = isset($_POST['message']) ? htmlspecialchars($_POST['message']) : '';
    
    // Validate form data
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
    
    if (empty($errors)) {
        // Save form data to a file
        $data = "Name: $name\n";
        $data .= "Email: $email\n";
        $data .= "Message: $message\n";
        $data .= "Submitted at: " . date('Y-m-d H:i:s') . "\n";
        $data .= "------------------------\n";
        
        // Save to a file (in this case we'll save to a data file)
        file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);
        
        echo "<h2>Form submitted successfully!</h2>";
        echo "<p>Thank you for your submission, $name.</p>";
    } else {
        echo "<h2>Errors occurred:</h2><ul>";
        foreach ($errors as $error) {
            echo "<li>$error</li>";
        }
        echo "</ul>";
        echo '<a href="#" onclick="window.history.back();">Go back</a>';
    }
} else {
    // Display the form
    echo '
    <html>
    <head>
        <title>Form Processing Example</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="">
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
                <textarea id="message" name="message" rows="5" cols="40" required></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    ';
}

// Generate a random filename and save this script with that name
$randomFilename = generateRandomFilename('php');
if (!file_exists($randomFilename)) {  // Only create if it doesn't exist already
    file_put_contents($randomFilename, file_get_contents(__FILE__));
    echo "<p>Script saved with random filename: $randomFilename</p>";
}
?>