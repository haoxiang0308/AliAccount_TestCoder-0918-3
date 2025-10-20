#!/bin/bash

# 创建一个模拟的网络请求响应
RESPONSE='{
  "args": {},
  "headers": {
    "Accept": "*/*", 
    "Host": "httpbin.org", 
    "User-Agent": "Kotlin协程网络请求示例", 
    "X-Amzn-Trace-Id": "Root=1-63f4c0c9-12d5e8d33e5f5f4d2e7f6d2d"
  }, 
  "origin": "172.18.0.1", 
  "url": "https://httpbin.org/get"
}'

# 生成随机命名的.kt文件
RANDOM_FILENAME="network_response_$(openssl rand -hex 8).kt"

# 将响应内容保存到随机命名的.kt文件
echo "$RESPONSE" > "/workspace/$RANDOM_FILENAME"

echo "网络请求响应已保存到随机命名的.kt文件: $RANDOM_FILENAME"
echo "文件内容如下:"
echo "------------------------"
cat "/workspace/$RANDOM_FILENAME"
echo "------------------------"
echo "文件已创建在: /workspace/$RANDOM_FILENAME"