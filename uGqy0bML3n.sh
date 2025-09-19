#!/bin/bash

# Script to check disk usage and alert if over 80%
# Filename: uGqy0bML3n.sh

# Get disk usage percentage (using root filesystem)
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is greater than 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80%!"
    # Optionally send email or other alert here
    # echo "WARNING: Disk usage is at ${USAGE}% which exceeds 80%!" | mail -s "Disk Usage Alert" admin@example.com
else
    echo "Disk usage is at ${USAGE}%. All good."
fi