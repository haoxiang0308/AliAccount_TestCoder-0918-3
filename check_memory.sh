#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "============================"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"
echo ""
echo "Memory Usage Percentage:"
echo "========================"
# Calculate memory usage percentage
total_mem=$(free | awk 'NR==2{print $2}')
used_mem=$(free | awk 'NR==2{print $3}')
mem_percentage=$(echo "scale=2; $used_mem * 100 / $total_mem" | bc)
echo "Memory Usage: $mem_percentage%"