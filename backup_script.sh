#!/bin/bash

# Script to create a backup of a file with a random name
# Usage: ./backup_script.sh <file_to_backup>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_to_backup>"
    exit 1
fi

file_to_backup="$1"

# Check if the file exists
if [ ! -f "$file_to_backup" ]; then
    echo "Error: File '$file_to_backup' does not exist."
    exit 1
fi

# Generate a random filename for the backup
random_name=$(date +%s%N)_$RANDOM
backup_name="${random_name}_$(basename "$file_to_backup")"

# Create the backup
cp "$file_to_backup" "$backup_name"

echo "Backup created: $backup_name"