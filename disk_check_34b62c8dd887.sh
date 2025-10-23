#!/bin/bash

# Function to check disk usage
check_disk_usage() {
    # Get the disk usage percentage (removing the % sign)
    usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')
    
    echo "Current disk usage: ${usage}%"
    
    # Check if usage is over 80%
    if [ "$usage" -gt 80 ]; then
        echo "ALERT: Disk usage is over 80%!"
        echo "Current usage: ${usage}%"
        # You could add additional alert mechanisms here (email, logging, etc.)
        exit 1
    else
        echo "Disk usage is normal: ${usage}%"
        exit 0
    fi
}

# Run the check
check_disk_usage