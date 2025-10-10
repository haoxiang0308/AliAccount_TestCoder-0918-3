# R script to create a bar plot and save it

# Define the data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 7, 12)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue")

# Save the plot as a PNG file
png("bar_plot_output.png")
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue")
dev.off()