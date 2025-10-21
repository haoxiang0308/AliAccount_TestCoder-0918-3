#!/bin/bash

# Function to create a backup with a random name
create_backup() {
    local source_file="$1"
    
    # Check if source file is provided
    if [[ -z "$source_file" ]]; then
        echo "Usage: $0 <file_to_backup>"
        exit 1
    fi
    
    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        echo "Error: File '$source_file' does not exist."
        exit 1
    fi
    
    # Get directory of source file
    local dir=$(dirname "$source_file")
    
    # Generate random name using date with nanoseconds if uuidgen not available
    local random_name
    if command -v uuidgen &> /dev/null; then
        random_name=$(uuidgen)
    else
        random_name=$(date +%s%N)
    fi
    
    # Create backup file path
    local backup_path="$dir/$random_name"
    
    # Create the backup
    cp "$source_file" "$backup_path"
    
    echo "Backup created: $backup_path"
}

# Call the function with the provided argument
create_backup "$1"