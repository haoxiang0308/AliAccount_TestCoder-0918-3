<?php
// Database configuration
$host = 'localhost';
$username = 'your_username';
$password = 'your_password';
$database = 'your_database';

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to the database!";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>