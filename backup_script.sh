#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  <source_directory>: The directory to backup (required)"
  echo "  [destination_directory]: The backup location (default: ./backups)"
  exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="${2:-./backups}" # Use ./backups as default if not provided

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create destination backup folder name
BACKUP_NAME="backup_$(basename "$SOURCE_DIR")_$TIMESTAMP"
DEST_PATH="$DEST_DIR/$BACKUP_NAME"

# Perform the copy using rsync for efficiency and robustness
echo "Starting backup of '$SOURCE_DIR' to '$DEST_PATH'..."
rsync -av --exclude='*/.git' "$SOURCE_DIR/" "$DEST_PATH/"

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $DEST_PATH"
else
  echo "Error: Backup failed during rsync operation."
  exit 1
fi