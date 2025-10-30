#!/bin/bash

# Script to get list of processes and save to a file with random name

# Generate a random filename
random_name=$(mktemp --suffix=.txt)
filename="$random_name"

# Get the list of processes and save to the file
ps aux > "$filename"

echo "Process list saved to $filename"