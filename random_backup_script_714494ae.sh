#!/bin/bash

# Check if source directory is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <source_directory>"
  exit 1
fi

SOURCE_DIR="$1"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create destination directory name with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="backup_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

echo "Backing up '$SOURCE_DIR' to '$BACKUP_DIR'..."

# Perform the copy using rsync for efficiency and robustness
rsync -av --exclude='*.tmp' --exclude='.DS_Store' "$SOURCE_DIR/" "$BACKUP_DIR/"

echo "Backup completed successfully in '$BACKUP_DIR'."