# 生成随机数据
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# 创建柱状图
barplot(values, names.arg = categories, col = rainbow(5), main = "随机数据柱状图", xlab = "类别", ylab = "值")

# 保存图表到文件
dev.copy(png, filename = "random_bar_plot.png", width = 600, height = 400)
dev.off()

# 输出数据和文件名
print(data.frame(类别 = categories, 值 = values))
print("图表已保存为 random_bar_plot.png")