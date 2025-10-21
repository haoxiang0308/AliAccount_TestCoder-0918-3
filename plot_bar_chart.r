# R script to create and save a bar chart

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar chart
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot to a file
# png("bar_chart.png", width = 600, height = 400)
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Chart",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()

cat("Bar chart created successfully!\n")