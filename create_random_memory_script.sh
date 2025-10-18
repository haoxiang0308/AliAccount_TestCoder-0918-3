#!/bin/bash

# Generate a random name for the memory check script
random_name="memory_check_$(date +%s%N).sh"

# Create the memory check script with random name
cat > "$random_name" << 'EOF'
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
EOF

echo "Memory check script created with random name: $random_name"
echo "To execute it, run: bash $random_name"