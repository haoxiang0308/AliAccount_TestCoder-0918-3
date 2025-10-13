# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")

# Сохранение графика в файл PNG со случайным именем
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")
png(random_name)
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")
dev.off()

cat("График сохранен в файл:", random_name, "\n")