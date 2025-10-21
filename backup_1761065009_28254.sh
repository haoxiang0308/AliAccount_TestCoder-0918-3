#!/bin/bash

# Script to create a backup of a file
# Usage: ./backup_script.sh <file_to_backup>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_to_backup>"
    exit 1
fi

file_to_backup="$1"

if [ ! -f "$file_to_backup" ]; then
    echo "Error: File '$file_to_backup' does not exist."
    exit 1
fi

# Create backup with timestamp
backup_name="${file_to_backup}.backup.$(date +%Y%m%d_%H%M%S)"

cp "$file_to_backup" "$backup_name"

if [ $? -eq 0 ]; then
    echo "Backup created: $backup_name"
else
    echo "Error creating backup."
    exit 1
fi