#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  source_directory: The directory to backup (required)"
  echo "  destination_directory: The directory to store the backup (optional, defaults to current directory)"
  exit 1
fi

SOURCE_DIR="$1"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Set destination directory, defaulting to current directory if not provided
DEST_DIR="${2:-.}"

# Create timestamped backup directory name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR_NAME="backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"
BACKUP_PATH="$DEST_DIR/$BACKUP_DIR_NAME"

# Create the backup directory
mkdir -p "$BACKUP_PATH"

# Perform the copy using rsync for efficiency and robustness
echo "Backing up '$SOURCE_DIR' to '$BACKUP_PATH'..."
rsync -av --progress "$SOURCE_DIR/" "$BACKUP_PATH/"

echo "Backup completed successfully in '$BACKUP_PATH'"