# R script to create a bar plot and save it

# Create sample data
categories <- c("A", "B", "C", "D")
values <- c(3, 7, 5, 2)

# Create the bar plot
barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Category", ylab = "Value")

# Save the plot as a PNG file
png("bar_plot.png")
barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Category", ylab = "Value")
dev.off()

cat("Bar plot saved as bar_plot.png\n")