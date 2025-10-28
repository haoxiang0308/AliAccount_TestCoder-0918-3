#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage (removing the % sign)
usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%!"
    echo "Please check available disk space."
else
    echo "Disk usage is at ${usage}% - within acceptable limits."
fi