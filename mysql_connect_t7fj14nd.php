<?php
/**
 * MySQL Database Connection Script
 * This script demonstrates how to connect to a MySQL database using both
 * MySQLi (procedural and object-oriented) and PDO methods.
 */

// Database configuration
$servername = "localhost";  // Change this to your MySQL server address
$username = "your_username"; // Change this to your MySQL username
$password = "your_password"; // Change this to your MySQL password
$dbname = "your_database";   // Change this to your database name

// Method 1: MySQLi Object-Oriented
echo "<h2>Connecting using MySQLi Object-Oriented:</h2>\n";
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully to database using MySQLi OOP<br>\n";

// Perform a simple query to test the connection
$result = $mysqli->query("SELECT VERSION() as version");
if ($result) {
    $row = $result->fetch_assoc();
    echo "MySQL Version: " . $row['version'] . "<br>\n";
}

// Close connection
$mysqli->close();

// Method 2: MySQLi Procedural
echo "<h2>Connecting using MySQLi Procedural:</h2>\n";
$connection = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully to database using MySQLi Procedural<br>\n";

// Perform a simple query to test the connection
$result = mysqli_query($connection, "SELECT DATABASE() as current_db");
if ($result) {
    $row = mysqli_fetch_assoc($result);
    echo "Current Database: " . $row['current_db'] . "<br>\n";
}

// Close connection
mysqli_close($connection);

// Method 3: PDO
echo "<h2>Connecting using PDO:</h2>\n";
try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully to database using PDO<br>\n";
    
    // Perform a simple query to test the connection
    $stmt = $pdo->query("SELECT NOW() as current_time");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "Current Time (from MySQL): " . $row['current_time'] . "<br>\n";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . "<br>\n";
}

// Close connection
$pdo = null;

echo "<h2>Connection test completed.</h2>\n";
?>