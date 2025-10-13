#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${usage}% which is over the ${THRESHOLD}% threshold!"
    exit 1
else
    echo "Disk usage is ${usage}%, which is OK."
    exit 0
fi