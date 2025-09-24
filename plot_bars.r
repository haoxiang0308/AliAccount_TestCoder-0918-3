# 创建示例数据
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# 绘制柱状图
barplot(values, names.arg = categories, main = "示例柱状图", xlab = "类别", ylab = "值")

# 保存图形到文件
# R中绘制的图通常保存为图片文件，而不是.r文件。
# 如果用户意图是保存R代码，则上面的代码块本身就是保存的.r文件。
# 如果用户意图是保存图片，则应使用以下命令：
# png("barplot.png")
# barplot(values, names.arg = categories, main = "示例柱状图", xlab = "类别", ylab = "值")
# dev.off()