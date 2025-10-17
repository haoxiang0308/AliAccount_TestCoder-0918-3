#!/bin/bash

# Check disk usage and alert if over 80%

# Get the disk usage percentage (removing the % sign)
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%"
    # You can add additional alert mechanisms here (email, logging, etc.)
else
    echo "Disk usage is at ${usage}% - within acceptable range"
fi