#!/bin/bash
# Bash script to get a list of processes and save to a file with a random name
random_name=$(shuf -i 1000-9999 -n 1).csv
ps aux > $random_name
echo "Process list saved to $random_name"