#!/bin/bash
# 生成一个随机文件名，格式为 user_info_XXXXXX.sh
RANDOM_FILENAME=$(mktemp --suffix=.sh /tmp/user_info.XXXXXX)

# 执行获取用户信息的脚本并将输出保存到随机命名的文件中
bash /workspace/get_user_info.sh > "$RANDOM_FILENAME"

echo "用户信息已保存到: $RANDOM_FILENAME"