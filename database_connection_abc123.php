<?php
// Configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully to the database!";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Example query (uncomment to use)
/*
$stmt = $pdo->query("SELECT id, name FROM your_table LIMIT 10");
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<br> ID: " . $row['id'] . " - Name: " . $row['name'];
}
*/

// Close the connection (optional, as it closes automatically at the end of the script)
// $pdo = null;
?>