# 生成随机数据
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# 创建柱状图
barplot(values, names.arg = categories, col = rainbow(5), main = "随机数据柱状图", xlab = "类别", ylab = "值")

# 保存图表到文件
dev.copy(png, "barplot_output.png")
dev.off()

# 输出信息
cat("数据:\n")
print(data.frame(类别 = categories, 值 = values))
cat("\n图表已保存为 barplot_output.png\n")