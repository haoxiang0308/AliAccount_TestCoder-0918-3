#!/bin/bash

# Check disk usage and alert if over 80%

# Get the root filesystem usage percentage
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Check if usage is greater than 80
if [ "$usage" -gt 80 ]; then
  echo "ALERT: Disk usage is ${usage}%!"
  # You could add an email command here, e.g., `echo "Alert" | mail -s "Disk Usage Alert" email@domain.com`
else
  echo "Disk usage is OK: ${usage}%"
fi