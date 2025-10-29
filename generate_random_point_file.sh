#!/bin/bash

# 生成随机文件名
random_filename="point_$(date +%s)_$((RANDOM % 1000)).scala"

# Scala样例类内容
scala_content="// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s\"Point(\$\$x, \$\$y)\"
}

// 示例使用
val point = Point(3.5, 7.2)
println(point)"

# 创建文件并写入内容
echo "$scala_content" > "/workspace/$random_filename"

echo "样例类已保存到文件: /workspace/$random_filename"
echo "文件内容:"
cat "/workspace/$random_filename"