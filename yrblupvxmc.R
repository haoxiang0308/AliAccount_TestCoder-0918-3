# R script to create a scatter plot and save it to a file

# Generate random data
set.seed(42)  # For reproducible results
x <- rnorm(100)
y <- rnorm(100)

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values", 
     pch = 19,  # Solid circles
     col = "blue")

# Save the plot to a PNG file
png("scatter_plot.png", width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values", 
     pch = 19, 
     col = "blue")
dev.off()

# Print confirmation
cat("Scatter plot saved as scatter_plot.png\n")