# R script to create a bar plot and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 7, 12)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")

# Save the plot as a PNG file
filename_png <- paste0("barplot_", sample(10000:99999, 1), ".png")
png(filename = filename_png)
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")
dev.off()

cat("Bar plot created and saved as", filename_png, "\n")

# Generate a random filename for the R script itself
r_script_name <- paste0("plot_script_", sample(10000:99999, 1), ".R")

# This script is being saved with a fixed name by the agent, 
# but the *generated* plot and its code could be saved under the random name.
# To simulate saving the core logic to a randomly named R file, 
# we can write the plotting code block to a new file with the random name.
plot_code <- '
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 7, 12)
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")
'
writeLines(plot_code, r_script_name)
cat("R code for the plot saved to", r_script_name, "\n")
