# R script to load a CSV file and print summary statistics

# Load CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
csv_data <- read.csv("your_file.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(csv_data))

# Print structure of the data
print("Data Structure:")
print(str(csv_data))

# Print first few rows
print("First 6 rows:")
print(head(csv_data))

# Print dimensions
print(paste("Dataset dimensions:", dim(csv_data)[1], "rows and", dim(csv_data)[2], "columns"))

# Additional statistics if the dataset contains numeric columns
numeric_cols <- sapply(csv_data, is.numeric)
if(any(numeric_cols)) {
  print("Additional statistics for numeric columns:")
  print(paste("Number of numeric columns:", sum(numeric_cols)))
  
  # Calculate means for numeric columns
  numeric_data <- csv_data[numeric_cols]
  means <- sapply(numeric_data, mean, na.rm = TRUE)
  print(paste("Means of numeric columns:", paste(means, collapse = ", ")))
  
  # Calculate standard deviations for numeric columns
  sds <- sapply(numeric_data, sd, na.rm = TRUE)
  print(paste("Standard deviations of numeric columns:", paste(sds, collapse = ", ")))
}