# R script to create a scatter plot and save with a random filename

# Generate random data
set.seed(42)  # For reproducible results
x <- rnorm(100, mean = 50, sd = 15)
y <- rnorm(100, mean = 30, sd = 10)

# Create a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot of Random Data", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # solid circles
     col = "blue",
     cex = 0.8)  # size of points

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Close the graphics device to save the file
dev.off()

cat("Scatter plot saved as:", random_name, "\n")