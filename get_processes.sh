#!/bin/bash
# Bash script to get processes and save to a random file
csv_path="/tmp/tmp.WueE8ARNJL.csv"
# Get process list in a simple format and add a header for CSV-like structure
echo "PID,TTY,TIME,CMD" > "$csv_path"
ps -eo pid,tty,time,comm --no-headers | sed 's/ \+/ /g' | sed 's/^ //g' >> "$csv_path"
echo "Process list saved to $csv_path"