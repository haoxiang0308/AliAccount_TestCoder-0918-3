# Script to create a scatter plot and save it with a random filename

# Generate random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Create sample data
x <- rnorm(100)
y <- rnorm(100)

# Create the scatter plot
png(random_name, width = 800, height = 600)
plot(x, y, main = "Scatter Plot", xlab = "X values", ylab = "Y values", pch = 16, col = "blue")
dev.off()

cat("Scatter plot saved as:", random_name, "\n")