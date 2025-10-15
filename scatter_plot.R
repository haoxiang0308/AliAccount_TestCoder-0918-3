# R script to create a scatter plot and save with a random filename

# Generate random data
set.seed(42)  # for reproducible random results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)  # y is correlated with x

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue")

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Generate a random filename for the output
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Save the plot as a PNG file
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue")
abline(lm(y ~ x), col = "red", lwd = 2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")