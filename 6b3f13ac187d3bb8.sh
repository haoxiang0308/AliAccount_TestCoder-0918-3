#!/bin/bash

# Script to create a backup of a file
# Usage: ./backup_script.sh <source_file> [backup_suffix]

create_backup() {
    local source_file="$1"
    local backup_suffix="${2:-.bak}"
    
    # Check if source file is provided
    if [ -z "$source_file" ]; then
        echo "Error: No source file specified."
        echo "Usage: $0 <source_file> [backup_suffix]"
        return 1
    fi
    
    # Check if source file exists
    if [ ! -f "$source_file" ]; then
        echo "Error: Source file '$source_file' does not exist."
        return 1
    fi
    
    # Create backup filename
    local backup_file="${source_file}${backup_suffix}"
    
    # Copy the file
    cp "$source_file" "$backup_file"
    
    if [ $? -eq 0 ]; then
        echo "Backup created: $backup_file"
    else
        echo "Error: Failed to create backup of '$source_file'"
        return 1
    fi
}

# Call the function with all arguments
create_backup "$@"