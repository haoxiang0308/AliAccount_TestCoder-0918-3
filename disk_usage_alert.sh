#!/bin/bash

# Check disk usage
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%!"
    exit 1
else
    echo "Disk usage is OK: ${usage}%"
    exit 0
fi