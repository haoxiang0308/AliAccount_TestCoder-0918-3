# Generate random data
set.seed(123)  # For reproducibility
x <- rnorm(100, mean = 50, sd = 10)
y <- 2 * x + rnorm(100, mean = 0, sd = 5)  # y is correlated with x plus some noise

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(100000:999999, 1), ".png")

# Create the scatter plot and save to the random filename
png(file = random_name)
plot(x, y, main = "Random Scatter Plot", xlab = "X values", ylab = "Y values")
dev.off()

# Print the filename to console
cat("Scatter plot saved to:", random_name, "\n")