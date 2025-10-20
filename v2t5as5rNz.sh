#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <source_directory> [destination_directory]"
    echo "Example: $0 /home/user/documents /backup/location"
    exit 1
}

# Check if source directory is provided
if [ -z "$1" ]; then
    echo "Error: Source directory not provided"
    usage
fi

SOURCE_DIR="$1"

# Set destination directory (default to current directory if not provided)
DEST_DIR="${2:-.}"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist"
    exit 1
fi

# Create timestamp for backup folder
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP"
BACKUP_PATH="$DEST_DIR/$BACKUP_NAME"

# Create the backup directory
mkdir -p "$BACKUP_PATH"

if [ $? -ne 0 ]; then
    echo "Error: Could not create backup directory '$BACKUP_PATH'"
    exit 1
fi

echo "Starting backup from '$SOURCE_DIR' to '$BACKUP_PATH'..."

# Perform the backup using rsync for efficiency
rsync -av --progress "$SOURCE_DIR/" "$BACKUP_PATH/"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "Backup location: $BACKUP_PATH"
else
    echo "Backup failed!"
    exit 1
fi