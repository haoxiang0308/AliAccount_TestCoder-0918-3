# R script to create a bar plot and save it as a random named .r file

# Define data for the bar plot
categories <- c("A", "B", "C", "D")
values <- c(3, 7, 5, 9)

# Create the bar plot
barplot(values, names.arg = categories, main = "Sample Bar Plot", xlab = "Category", ylab = "Value")

# Generate a random filename
random_name <- paste0(sample(c(letters, 0:9), 10, replace = TRUE), collapse = "")
random_filename <- paste0(random_name, ".r")

# Save this script with the random name
file.copy("plot_script.r", random_filename)
cat("Script saved as:", random_filename, "\n")