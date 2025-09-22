#!/bin/bash

# Generate a random file name
randomFileName="processes_$(shuf -i 1000-9999 -n 1).txt"

# Get the list of processes and save to the file
ps aux > "$randomFileName"

# Output confirmation
echo "Processes saved to $randomFileName"