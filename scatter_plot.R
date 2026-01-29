# Генерация случайного имени файла
set.seed(Sys.time())
filename <- paste0("scatter_plot_", sample(1:10000, 1), ".png")

# Создание случайных данных
set.seed(42)
x <- rnorm(100)
y <- rnorm(100)

# Построение диаграммы рассеяния
png(filename, width = 800, height = 600)
plot(x, y, 
     main = "Диаграмма рассеяния",
     xlab = "X значения",
     ylab = "Y значения",
     pch = 19,
     col = "blue")
dev.off()

cat("Диаграмма сохранена в файл:", filename, "\n")
