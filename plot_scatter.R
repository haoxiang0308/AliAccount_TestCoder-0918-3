#!/usr/bin/env Rscript

# Загрузка библиотеки ggplot2 для продвинутой визуализации
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Создание случайных данных
set.seed(42)  # Для воспроизводимости
n <- 100
data <- data.frame(
  x = rnorm(n, mean = 50, sd = 15),
  y = rnorm(n, mean = 50, sd = 15)
)

# Создание диаграммы рассеяния с помощью ggplot2
p <- ggplot(data, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "Scatter Plot", x = "X-axis", y = "Y-axis") +
  theme_minimal()

# Генерация случайного имени файла
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Сохранение графика в файл
ggsave(random_name, plot = p, device = "png", path = ".")

cat("Scatter plot saved to file:", random_name, "\n")