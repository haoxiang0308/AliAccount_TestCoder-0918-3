#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Compare the usage percentage to the threshold
if [ "$usage" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${usage}% which is over the ${THRESHOLD}% threshold!"
    # Optionally, you could send an email or log this to a file
    # logger "Disk usage alert: ${usage}%"
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is ${usage}%"
else
    echo "Disk usage is ${usage}%, which is within the normal range."
fi