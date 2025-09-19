#!/bin/bash

# Disk usage checker script
# Alerts if disk usage exceeds 80%

# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% - Cleanup recommended!"
    # Optionally send email or other alert
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is at ${USAGE}%"
else
    echo "Disk usage is at ${USAGE}% - Within acceptable limits."
fi