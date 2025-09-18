#!/bin/bash
# Generate a random string
RANDOM_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

# Copy the PHP file with the random name
cp /workspace/mysql_connection.php "/workspace/${RANDOM_NAME}.php"

# Display the generated file name
echo "PHP script saved as: ${RANDOM_NAME}.php"