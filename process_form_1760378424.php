<?php
// PHP script to handle a form
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Process form data here
    $name = $_POST['name'] ?? 'Anonymous';
    $email = $_POST['email'] ?? 'No email provided';

    // Example: Save to a file
    $data = "Name: $name, Email: $email\n";
    file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

    echo "Form processed successfully. Name: $name, Email: $email";
} else {
    echo "This script only handles POST requests.";
}
?>
