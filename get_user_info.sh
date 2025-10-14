#!/bin/bash

# 获取当前用户名
USERNAME=$(whoami)
echo "Username: $USERNAME"

# 获取当前用户的用户ID (UID)
USERID=$(id -u)
echo "User ID: $UID"

# 获取当前用户的家目录
HOMEDIR=$(echo $HOME)
echo "Home Directory: $HOMEDIR"

# 获取当前用户的主组ID
GROUPID=$(id -g)
echo "Group ID: $GROUPID"

# 获取当前用户的登录shell
SHELL=$(echo $SHELL)
echo "Login Shell: $SHELL"

# 获取当前用户的完整名称 (如果设置)
FULLNAME=$(getent passwd $USERNAME | cut -d: -f5 | cut -d, -f1)
echo "Full Name: $FULLNAME"

# 获取当前用户的所有组
GROUPS=$(groups)
echo "Groups: $GROUPS"