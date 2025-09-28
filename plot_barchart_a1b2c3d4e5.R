# R script to create a bar chart and save it as a PNG file

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create a bar plot
barplot(values,
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Optionally, save the plot to a file
# png("barchart.png")
# barplot(values,
#         names.arg = categories,
#         main = "Sample Bar Chart",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "skyblue",
#         border = "black")
# dev.off()