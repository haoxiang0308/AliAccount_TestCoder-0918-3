<?php
// PHP script to handle form processing
// This script demonstrates form handling with validation and data processing

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form data
    $name = $email = $message = "";
    $nameErr = $emailErr = $messageErr = "";
    $isValid = true;
    
    // Validate and sanitize name
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
    
    // Validate and sanitize email
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
        $isValid = false;
    } else {
        $email = sanitizeInput($_POST["email"]);
        // Check if email address is well-formed
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
            $isValid = false;
        }
    }
    
    // Validate and sanitize message
    if (empty($_POST["message"])) {
        $messageErr = "Message is required";
        $isValid = false;
    } else {
        $message = sanitizeInput($_POST["message"]);
    }
    
    // If all inputs are valid, process the data
    if ($isValid) {
        // Here you could save to database, send email, etc.
        $data = array(
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        );
        
        // Example: Save to a file (in a real application, you'd likely use a database)
        $logFile = 'form_submissions.txt';
        $logData = json_encode($data) . "\n";
        file_put_contents($logFile, $logData, FILE_APPEND | LOCK_EX);
        
        // Success response
        echo "<h2>Form Submission Successful!</h2>";
        echo "<p>Name: " . $data['name'] . "</p>";
        echo "<p>Email: " . $data['email'] . "</p>";
        echo "<p>Message: " . $data['message'] . "</p>";
        echo "<p>Submitted on: " . $data['timestamp'] . "</p>";
        exit;
    }
}

// If not submitted via POST or validation failed, show the form
?>

<!DOCTYPE html>
<html>
<head>
    <title>Form Handler Example</title>
    <style>
        .error {color: #FF0000;}
        .form-container {max-width: 600px; margin: 0 auto; padding: 20px;}
        .form-group {margin-bottom: 15px;}
        label {display: block; margin-bottom: 5px; font-weight: bold;}
        input[type="text"], input[type="email"], textarea {
            width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;
        }
        textarea {height: 100px; resize: vertical;}
        input[type="submit"] {
            background-color: #4CAF50; color: white; padding: 10px 20px;
            border: none; border-radius: 4px; cursor: pointer;
        }
        input[type="submit"]:hover {background-color: #45a049;}
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Contact Form</h2>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? $name : ''; ?>">
                <span class="error"><?php echo $nameErr;?></span>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<?php echo isset($_POST['email']) ? $email : ''; ?>">
                <span class="error"><?php echo $emailErr;?></span>
            </div>
            
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message"><?php echo isset($_POST['message']) ? $message : ''; ?></textarea>
                <span class="error"><?php echo $messageErr;?></span>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
</body>
</html>