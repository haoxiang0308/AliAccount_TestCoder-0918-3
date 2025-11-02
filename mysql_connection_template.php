<?php
// MySQL Database Connection Script

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
    
    // Example: Perform a simple query
    $stmt = $pdo->query("SELECT 1");
    $result = $stmt->fetch();
    
    // Close connection
    $pdo = null;
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>