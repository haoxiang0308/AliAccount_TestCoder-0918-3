#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (using df command and extracting the number)
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    # You could add additional alert mechanisms here (email, logging, etc.)
else
    echo "Disk usage is ${USAGE}%, which is within acceptable limits."
fi