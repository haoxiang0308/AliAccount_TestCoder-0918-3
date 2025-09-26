<?php
// Database configuration
\$servername = "localhost";
\$username = "your_username";
\$password = "your_password";
\$dbname = "your_database_name";

try {
    // Create a new PDO connection
    \$conn = new PDO("mysql:host=\$servername;dbname=\$dbname", \$username, \$password);
    
    // Set the PDO error mode to exception
    \$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    echo "Connected successfully";
    
    // Example: Perform a simple query
    // \$stmt = \$conn->prepare("SELECT * FROM your_table_name LIMIT 1");
    // \$stmt->execute();
    // \$result = \$stmt->fetch(PDO::FETCH_ASSOC);
    // print_r(\$result);
    
} catch(PDOException \$e) {
    echo "Connection failed: " . \$e->getMessage();
}

// Close the connection (optional as it's done automatically at the end of the script)
// \$conn = null;
?>