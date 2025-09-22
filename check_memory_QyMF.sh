#!/bin/bash

# 检查系统内存使用情况的脚本

# 获取内存信息
free -h

# 获取更详细的内存信息
echo -e "\nDetailed memory usage:"
cat /proc/meminfo | grep -E 'MemTotal|MemFree|MemAvailable|Buffers|Cached'

# 计算内存使用率
echo -e "\nMemory Usage Summary:"
total_mem=$(free | grep Mem | awk '{print $2}')
used_mem=$(free | grep Mem | awk '{print $3}')
free_mem=$(free | grep Mem | awk '{print $4}')

# 将KB转换为GB，用于显示
total_mem_gb=$(echo "scale=2; $total_mem/1024/1024" | bc)
used_mem_gb=$(echo "scale=2; $used_mem/1024/1024" | bc)
free_mem_gb=$(echo "scale=2; $free_mem/1024/1024" | bc)

echo "Total Memory: ${total_mem_gb} GB"
echo "Used Memory: ${used_mem_gb} GB"
echo "Free Memory: ${free_mem_gb} GB"

usage_percent=$(echo "scale=2; $used_mem * 100 / $total_mem" | bc)
echo "Memory Usage: ${usage_percent}%"