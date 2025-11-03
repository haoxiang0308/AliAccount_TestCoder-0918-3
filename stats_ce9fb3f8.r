# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: You should replace "your_file.csv" with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))

# Print dimensions
print(paste("Dimensions:", nrow(data), "rows and", ncol(data), "columns"))