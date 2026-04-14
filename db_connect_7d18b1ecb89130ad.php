<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using PDO.
 */

// Database configuration
$host = 'localhost';
$dbname = 'your_database_name';
$username = 'your_username';
$password = 'your_password';

try {
    // Create a PDO connection
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    
    $pdo = new PDO($dsn, $username, $password, $options);
    
    echo "Successfully connected to the database!\n";
    
    // Example query (uncomment and modify as needed)
    // $stmt = $pdo->query("SELECT VERSION()");
    // $version = $stmt->fetchColumn();
    // echo "MySQL Version: " . $version . "\n";
    
} catch (PDOException $e) {
    // Handle connection errors
    echo "Connection failed: " . $e->getMessage() . "\n";
    exit(1);
}
?>
