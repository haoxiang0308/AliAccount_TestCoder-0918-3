<?php
/**
 * MySQL Database Connection Script
 */

$host = 'localhost';
$port = 3306;
$username = 'your_username';
$password = 'your_password';
$database = 'your_database_name';

// Create connection
$connection = new mysqli($host, $username, $password, $database, $port);

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

echo "Connected successfully to MySQL database: " . $database . "\n";

// Example: Test the connection with a simple query
$result = $connection->query("SELECT 1 as test");
if ($result) {
    echo "Database query executed successfully.\n";
    $result->free();
}

// Close connection
$connection->close();
echo "Connection closed.\n";
?>
