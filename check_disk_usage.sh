#!/bin/bash

# Check disk usage and alert if over 80%
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

if [ "$usage" -gt 80 ]; then
  echo "ALERT: Disk usage is ${usage}%!"
  exit 1
else
  echo "Disk usage is OK: ${usage}%."
  exit 0
fi