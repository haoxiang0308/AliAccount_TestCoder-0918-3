#!/bin/bash

# Script to check system memory usage and save the output to a randomly named .sh file

# Get the memory usage information
memory_info=$(free -h)

# Generate a random name for the output file
random_filename=$(mktemp --suffix=.sh)

# Save the memory information to the randomly named file
echo "$memory_info" > "$random_filename"

# Print the name of the created file
echo "Memory usage information saved to: $random_filename"

# Optional: Display the content of the created file
cat "$random_filename"