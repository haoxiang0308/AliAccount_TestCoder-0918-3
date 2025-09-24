# Загрузка необходимых библиотек (если потребуется)
# library(ggplot2) # Пример для альтернативного способа

# Генерация случайных данных
set.seed(42) # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5) # y зависит от x с небольшим шумом
data <- data.frame(x = x, y = y)

# Создание диаграммы рассеяния
plot_title <- "Scatter Plot of X vs Y"
plot(x, y, main = plot_title, xlab = "X Variable", ylab = "Y Variable", pch = 19, col = "blue")

# Генерация случайного имени файла
random_filename <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Сохранение графика в файл
png(filename = random_filename, width = 800, height = 600)
plot(x, y, main = plot_title, xlab = "X Variable", ylab = "Y Variable", pch = 19, col = "blue")
dev.off()

cat("График сохранен в файл:", random_filename, "\n")