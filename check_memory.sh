#!/bin/bash

# Script to check system memory usage and save the output to a randomly named .sh file

# Get memory usage information
memory_info=$(free -h)

# Generate a random filename with .sh extension
random_filename=$(mktemp --suffix=.sh)

# Save the memory information to the randomly named file
echo "$memory_info" > "$random_filename"

echo "Memory usage information saved to: $random_filename"
cat "$random_filename"
