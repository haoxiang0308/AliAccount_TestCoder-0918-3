# Генерация случайных данных
set.seed(123) # Для воспроизводимости
x <- rnorm(100, mean = 50, sd = 10)
y <- 2 * x + rnorm(100, mean = 0, sd = 5)

# Создание диаграммы рассеяния
plot(x, y, 
     main = "Диаграмма рассеяния",
     xlab = "X переменная",
     ylab = "Y переменная",
     pch = 19,
     col = "blue")

# Добавление линии регрессии
model <- lm(y ~ x)
abline(model, col = "red", lwd = 2)

# Сохранение графика в файл
filename <- paste0("scatter_plot_", sprintf("%06d", sample(1:999999, 1)), ".png")
png(filename)
plot(x, y, 
     main = "Диаграмма рассеяния",
     xlab = "X переменная",
     ylab = "Y переменная",
     pch = 19,
     col = "blue")
abline(model, col = "red", lwd = 2)
dev.off()

cat("График сохранен в файл:", filename, "\n")