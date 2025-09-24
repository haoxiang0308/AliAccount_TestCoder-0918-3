#!/bin/bash

# 检查系统内存使用情况并输出到终端
echo "当前系统内存使用情况："
free -h

# 将内存使用情况保存到一个随机命名的 .sh 文件中
# 使用 $$ (当前进程ID) 和 $RANDOM (随机数) 来生成一个相对唯一的文件名
# 并将其放在 /tmp 目录下以避免权限问题
random_filename="/tmp/memory_usage_check_$$${RANDOM}.sh"

echo "#!/bin/bash" > "$random_filename"
echo "" >> "$random_filename"
echo "# 系统内存使用情况快照" >> "$random_filename"
echo "# 生成时间: $(date)" >> "$random_filename"
echo "" >> "$random_filename"
echo "# 内存总览:" >> "$random_filename"
free -h >> "$random_filename"

echo "内存使用情况已保存到: $random_filename"
echo "文件内容如下:"
echo "-----------------------------"
cat "$random_filename"
echo "-----------------------------"

# 提示用户该文件是可执行的，但内容主要是文本报告
echo "注意: 此脚本文件已创建，但其内容为内存报告。执行它将再次运行 'free -h' 命令。"