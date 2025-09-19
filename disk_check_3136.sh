#!/bin/bash

# Script to check disk usage and alert if over 80%
# Generated on: $(date)

# Get disk usage percentage (using / partition as an example)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage is over 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which is over 80%!"
    # You could add email notification or other alerting mechanisms here
else
    echo "Disk usage is at ${USAGE}%. All good."
fi