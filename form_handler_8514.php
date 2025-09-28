<?php
// Check if the form was submitted using POST method
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and retrieve form data
    $name = htmlspecialchars($_POST["name"] ?? "");
    $email = htmlspecialchars($_POST["email"] ?? "");
    $message = htmlspecialchars($_POST["message"] ?? "");

    // Basic validation
    if (empty($name) || empty($email) || empty($message)) {
        die("Error: All fields are required.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Error: Invalid email format.");
    }

    // Define the data to save
    $data = "Name: $name
Email: $email
Message: $message
---

";

    // Attempt to save the data to a file
    $filename = "form_submissions.txt";
    if (file_put_contents($filename, $data, FILE_APPEND | LOCK_EX)) {
        echo "Form data successfully saved to $filename";
    } else {
        echo "Error: Could not save data to file.";
    }
} else {
    // If not a POST request, show a simple form for testing
    echo "<form method="post" action="" . $_SERVER["PHP_SELF"] . "">
            Name: <input type="text" name="name" required><br><br>
            Email: <input type="email" name="email" required><br><br>
            Message: <textarea name="message" required></textarea><br><br>
            <input type="submit" value="Submit">
          </form>"; 
}
?>
