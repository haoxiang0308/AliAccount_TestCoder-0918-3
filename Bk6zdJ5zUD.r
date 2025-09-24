# R script to generate a bar plot and save it
# This script will be saved with a random name

# Define data for the bar plot
categories <- c("A", "B", "C", "D")
values <- c(10, 25, 15, 30)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Save the plot as a PNG file
# The `dev.copy` and `dev.off` functions can be used to save the current plot device.
# However, to save the *generation code* as requested, we just need to create this script file.
# The actual execution and saving of the plot image would happen when this script is run.
# For the purpose of this task, saving the script itself is sufficient based on the request.
