#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (removing the % sign)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Compare usage to threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}% which is above the ${THRESHOLD}% threshold!"
    exit 1
else
    echo "Disk usage is at ${USAGE}%, which is within acceptable limits."
    exit 0
fi