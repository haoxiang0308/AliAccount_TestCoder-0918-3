# Load the CSV file into a data frame
# Assumes the CSV file is named 'data.csv' and is in the current working directory
data <- read.csv("data.csv")

# Print summary statistics for the data frame
print(summary(data))