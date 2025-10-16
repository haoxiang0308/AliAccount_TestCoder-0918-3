<?php
// Database configuration
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

try {
    // Create connection using PDO
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully to MySQL database using PDO";
    
    // Alternative: Using mysqli
    /*
    $mysqli = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }
    echo "Connected successfully to MySQL database using MySQLi";
    */
    
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close connection (PDO will close automatically at the end of the script)
// For mysqli, you would use: $mysqli->close();
?>