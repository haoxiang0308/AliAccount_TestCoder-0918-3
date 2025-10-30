# Генерация случайных данных
set.seed(123)  # для воспроизводимости
x <- rnorm(100)
y <- rnorm(100)

# Генерация случайного имени файла
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Сохранение диаграммы рассеяния в файл
png(random_name)
plot(x, y, main="Scatter Plot", xlab="X-axis", ylab="Y-axis", pch=19, col="blue")
dev.off()

cat("Диаграмма рассеяния сохранена в файл:", random_name, "\n")