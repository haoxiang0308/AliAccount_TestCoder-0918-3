#!/bin/bash

# 脚本：check_memory.sh
# 功能：检查系统内存使用情况并以易于阅读的格式显示

echo "正在检查内存使用情况..."
echo "-----------------------------"

# 使用 free 命令获取内存信息，并用 awk 格式化输出
free -h | awk '
NR==1 {printf "%-15s %-10s %-10s %-10s %-10s %-15s\n", $1, $2, $3, $4, $5, $6} # 打印标题行
NR==2 {printf "%-15s %-10s %-10s %-10s %-10s %-15s\n", "内存(" $1 ")", $2, $3, $4, $5, $6} # 打印内存总览
'

echo "-----------------------------"
echo "详细信息："
# 显示更详细的内存信息
cat /proc/meminfo | grep -E "^(MemTotal|MemFree|MemAvailable|Buffers|Cached|SwapTotal|SwapFree):"