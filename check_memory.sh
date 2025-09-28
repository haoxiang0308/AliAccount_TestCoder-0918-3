#!/bin/bash

# Script to check system memory usage and save the report to a file

# Get the current date and time for the filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="/workspace/memory_report_$TIMESTAMP.txt"

# Use the 'free' command to get memory usage and save it to the report file
free -h > "$REPORT_FILE"

# Also print the memory usage to the console
echo "Memory usage report saved to $REPORT_FILE"
echo ""
cat "$REPORT_FILE"
