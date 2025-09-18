#!/bin/bash

# Script to check disk usage and alert if over 80%
# File name: 37aJSeJidJ.sh

# Get disk usage percentage (using root filesystem)
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80%
if [ "$usage" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${usage}% which exceeds 80% threshold!"
    # You can add additional alerting mechanisms here
    # For example, sending an email or writing to a log file
else
    echo "Disk usage is at ${usage}%. All good!"
fi