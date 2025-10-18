#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
cat /proc/meminfo | grep -E "(MemTotal|MemFree|MemAvailable|Buffers|Cached)"
echo ""
echo "Memory Usage Percentage:"
df -h | grep -E "tmpfs|rootfs" || echo "Memory usage by mount points:"
