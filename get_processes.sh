#!/bin/bash
# Script to get list of processes and save to a file with random name

# Get the process list (equivalent to Get-Process in PowerShell)
processes=$(ps aux)

# Generate a random filename
random_filename="processes_$$"_"$RANDOM".txt

# Save the process list to the file
echo "$processes" > "$random_filename"

echo "Process list saved to $random_filename"