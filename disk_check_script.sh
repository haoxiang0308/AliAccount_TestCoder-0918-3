#!/bin/bash

# Check disk usage and alert if over 80%

usage=$(df / | tail -n 1 | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%"
else
    echo "Disk usage is at ${usage}%"
fi