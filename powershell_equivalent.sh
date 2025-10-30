#!/bin/bash

# PowerShell equivalent: Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File -FilePath "filename.txt"
# Linux equivalent to list running services and save to a file with a random name

# Generate a random filename
RANDOM_FILENAME="/workspace/running_services_$(date +%s)_$$.txt"

# Alternative approach for listing running processes (services) in a container
# Since systemctl is not available in this environment, we'll use ps to list processes
ps aux --no-headers | grep -v grep > "$RANDOM_FILENAME"

echo "Running processes (services equivalent) have been saved to: $RANDOM_FILENAME"
ls -la "$RANDOM_FILENAME"
cat "$RANDOM_FILENAME" | head -10  # Show first 10 lines as sample