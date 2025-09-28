#!/bin/bash

# 获取总内存、已用内存和可用内存（以MB为单位）
total_memory=$(free -m | awk 'NR==2{print $2}')
used_memory=$(free -m | awk 'NR==2{print $3}')
available_memory=$(free -m | awk 'NR==2{print $4}')

# 计算内存使用百分比
memory_usage_percent=$(free | awk 'NR==2{printf "%.2f", $3*100/$2}')

# 创建一个唯一的输出文件名
output_file="/tmp/memory_report_$(date +%s).txt"

# 将内存信息写入文件
echo "Memory Report - $(date)" > "$output_file"
echo "Total Memory: ${total_memory} MB" >> "$output_file"
echo "Used Memory: ${used_memory} MB" >> "$output_file"
echo "Available Memory: ${available_memory} MB" >> "$output_file"
echo "Memory Usage: ${memory_usage_percent}%" >> "$output_file"

# 显示报告内容到终端
cat "$output_file"

echo "Report saved to: $output_file"