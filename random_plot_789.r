# R script to create a bar plot and save it

# Create sample data
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
# Note: The question asks to save the R code itself, not the plot image.
# This script, when run, will generate the plot.