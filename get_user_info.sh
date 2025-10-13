#!/bin/bash
# 获取当前用户名
USERNAME=$(whoami)
echo "当前用户名: $USERNAME"

# 获取当前用户的家目录
HOME_DIR=$(eval echo ~$USERNAME)
echo "家目录: $HOME_DIR"

# 获取当前用户的用户ID (UID)
USER_ID=$(id -u $USERNAME)
echo "用户ID (UID): $USER_ID"

# 获取当前用户的组ID (GID)
GROUP_ID=$(id -g $USERNAME)
echo "组ID (GID): $GROUP_ID"

# 获取当前用户所属的所有组
GROUPS=$(id -n -G $USERNAME | tr ' ' ', ')
echo "所属组: $GROUPS"

# 获取当前用户的登录Shell
USER_SHELL=$(getent passwd $USERNAME | cut -d: -f7)
echo "登录Shell: $USER_SHELL"