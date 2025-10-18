# R script to create a bar chart
# Generate sample data
data <- data.frame(
  category = c("A", "B", "C", "D", "E"),
  values = c(23, 45, 56, 78, 32)
)

# Create bar chart
barplot(data$values, 
        names.arg = data$category,
        main = "Sample Bar Chart",
        xlab = "Category",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot to a file
# png("bar_chart.png")
# barplot(data$values, 
#         names.arg = data$category,
#         main = "Sample Bar Chart",
#         xlab = "Category",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()