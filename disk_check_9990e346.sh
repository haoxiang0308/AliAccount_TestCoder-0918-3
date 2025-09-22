#!/bin/bash

# Disk usage checker script
# Alerts if disk usage exceeds the threshold

# Set threshold (default 80%)
THRESHOLD=80

# Get disk usage percentage for the root filesystem
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the threshold of ${THRESHOLD}%"
    echo "Please clean up some space."
    exit 1
else
    echo "Disk usage is at ${USAGE}%, which is below the threshold of ${THRESHOLD}%"
    exit 0
fi