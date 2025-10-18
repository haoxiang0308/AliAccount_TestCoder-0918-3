<?php
// MySQL Database Connection Script

// Database configuration
$host = 'localhost'; // Change this to your MySQL server host
$username = 'your_username'; // Replace with your MySQL username
$password = 'your_password'; // Replace with your MySQL password
$database = 'your_database'; // Replace with your database name

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database!";
    
    // Example: Execute a simple query
    $stmt = $pdo->query("SELECT VERSION()");
    $version = $stmt->fetch();
    echo "\nMySQL Version: " . $version[0];
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$pdo = null;
?>