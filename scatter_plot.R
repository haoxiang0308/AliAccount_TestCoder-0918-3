# Генерация случайных данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание DataFrame
data <- data.frame(x = x, y = y)

# Генерация случайного имени файла для изображения
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Открытие устройства PNG для сохранения графика
png(random_name, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(data$x, data$y,
     main = "Scatter Plot of Random Data",
     xlab = "X values",
     ylab = "Y values",
     pch = 19, # Стиль точек
     col = "blue" # Цвет точек
)

# Закрытие устройства PNG (сохранение файла)
dev.off()

# Вывод имени созданного файла
cat("Scatter plot saved as:", random_name, "\n")