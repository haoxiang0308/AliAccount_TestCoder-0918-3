# R script to create a bar chart and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 7, 12)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Save the plot as a PNG file
png("bar_chart_output.png")
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")
dev.off()

cat("Bar chart saved as 'bar_chart_output.png'\n")