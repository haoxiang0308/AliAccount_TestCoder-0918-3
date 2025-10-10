#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    # You can add additional commands here, like sending an email or logging to a file
else
    echo "Disk usage is ${USAGE}%, which is under the ${THRESHOLD}% threshold."
fi