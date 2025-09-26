#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Compare usage to threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    # You could add an exit code here if this script is used in a monitoring system
    # exit 1
else
    echo "Disk usage is ${USAGE}%, which is within the normal range."
    # exit 0
fi