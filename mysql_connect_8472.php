<?php
// Database configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Example: Execute a simple query
    $stmt = $pdo->query("SELECT 1 as test");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    print_r($result);
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$pdo = null;
?>