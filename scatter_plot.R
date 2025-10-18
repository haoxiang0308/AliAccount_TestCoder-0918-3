# R script to create a scatter plot and save it with a random filename

# Generate random data
set.seed(sample(1:10000, 1))  # Set a random seed for variability
x <- rnorm(100)  # 100 random x values from normal distribution
y <- rnorm(100)  # 100 random y values from normal distribution

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot of Random Data", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,  # Solid circles
     col = "blue")

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Save the plot to a file with the random name
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot of Random Data", 
     xlab = "X Values", 
     ylab = "Y Values",
     pch = 19,
     col = "blue")
dev.off()

cat("Scatter plot saved as:", random_name, "\n")