#!/bin/bash

# Check if source file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

SOURCE_FILE="$1"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist."
    exit 1
fi

# Generate a random filename for the backup
BACKUP_FILE="/workspace/backup_$(date +%s%N).bak"

# Perform the copy
cp "$SOURCE_FILE" "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Error: Failed to create backup."
    exit 1
fi