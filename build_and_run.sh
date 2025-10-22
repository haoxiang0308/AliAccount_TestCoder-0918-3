#!/bin/bash

# 设置Kotlin编译器路径
KOTLIN_HOME="/workspace/kotlinc"
KOTLIN_COMPILER="$KOTLIN_HOME/lib/kotlin-compiler.jar"
KOTLIN_STDLIB="$KOTLIN_HOME/lib/kotlin-stdlib.jar"
KOTLIN_COROUTINES="$KOTLIN_HOME/lib/kotlinx-coroutines-core-jvm.jar"

# 编译Kotlin文件
echo "编译Kotlin文件..."
java -jar "$KOTLIN_COMPILER" -cp "$KOTLIN_STDLIB:$KOTLIN_COROUTINES" -include-runtime NetworkRequestExample.kt -d NetworkRequestExample.jar

if [ $? -eq 0 ]; then
    echo "编译成功！"
    echo "运行程序..."
    java -cp "NetworkRequestExample.jar:$KOTLIN_COROUTINES" NetworkRequestExampleKt
else
    echo "编译失败！"
fi