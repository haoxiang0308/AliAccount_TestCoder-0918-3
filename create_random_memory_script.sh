#!/bin/bash

# Get memory usage information
memory_info=$(free -h)

# Generate a random filename with .sh extension in the current directory
random_filename="memory_check_$(date +%s)_$$.sh"

# Write memory information to the random file
echo "# Memory usage information" > "$random_filename"
echo "# Generated on $(date)" >> "$random_filename"
echo "" >> "$random_filename"
echo "$memory_info" >> "$random_filename"

echo "Memory usage information saved to: $random_filename"
echo "File contents:"
cat "$random_filename"