#!/bin/bash

# Check disk usage and alert if over 80%
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%!"
    exit 1
else
    echo "Disk usage is at ${usage}%. OK."
    exit 0
fi