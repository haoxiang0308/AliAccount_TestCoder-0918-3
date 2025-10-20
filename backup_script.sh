#!/bin/bash

# Function to create a backup of a directory to a timestamped folder
backup_directory() {
    local source_dir="$1"
    local dest_base="$2"
    
    # Check if source directory is provided
    if [ -z "$source_dir" ]; then
        echo "Usage: $0 <source_directory> [destination_base_directory]"
        echo "Example: $0 /path/to/source /path/to/backups"
        exit 1
    fi
    
    # Set default destination if not provided
    if [ -z "$dest_base" ]; then
        dest_base="./backups"
    fi
    
    # Create destination base directory if it doesn't exist
    mkdir -p "$dest_base"
    
    # Generate timestamp for the backup folder
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_folder="${dest_base}/backup_${timestamp}"
    
    # Create the backup directory
    mkdir -p "$backup_folder"
    
    # Perform the backup using rsync for efficiency
    if command -v rsync >/dev/null 2>&1; then
        echo "Creating backup of '$source_dir' to '$backup_folder'..."
        rsync -av --exclude='.DS_Store' "$source_dir/" "$backup_folder/"
    else
        # Fallback to cp if rsync is not available
        echo "Creating backup of '$source_dir' to '$backup_folder'..."
        cp -r "$source_dir" "$backup_folder/"
    fi
    
    echo "Backup completed successfully!"
    echo "Backup location: $backup_folder"
}

# Call the function with command line arguments
backup_directory "$1" "$2"