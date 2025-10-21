#!/bin/bash

# Function to check memory usage and save to a random .sh file
check_memory_and_save() {
    # Get memory usage information
    memory_info=$(free -h)
    
    # Generate a random filename with .sh extension
    random_filename=$(mktemp --suffix=.sh)
    
    # Write memory information to the random file
    echo "# Memory usage information" > "$random_filename"
    echo "# Generated on $(date)" >> "$random_filename"
    echo "" >> "$random_filename"
    echo "$memory_info" >> "$random_filename"
    
    echo "Memory usage information saved to: $random_filename"
    echo "File contents:"
    cat "$random_filename"
}

# Call the function
check_memory_and_save