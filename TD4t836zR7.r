# R script to create a bar plot
# Randomly generated data for the bar plot
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot as a PNG file
png("barplot.png")
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")
dev.off()

print("Bar plot created and saved as barplot.png")