# R script to create a bar plot

# Create sample data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 7, 12)

# Create the bar plot
barplot(values,
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Optionally, save the plot to a file
# png("barplot.png")
# barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Categories", ylab = "Values", col = "skyblue", border = "black")
# dev.off()