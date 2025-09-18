# R Script to Load CSV and Print Summary Statistics
# Generate random data if file doesn't exist, otherwise load file

# Check if command line argument is provided
args <- commandArgs(trailingOnly = TRUE)

# If no argument provided or file doesn't exist, create sample data
if (length(args) == 0 || !file.exists(args[1])) {
  # Create sample data
  set.seed(123)  # For reproducibility
  sample_data <- data.frame(
    ID = 1:100,
    Age = sample(18:80, 100, replace = TRUE),
    Income = round(rnorm(100, 50000, 15000)),
    Score = runif(100, 0, 100)
  )
  
  # Write to CSV
  write.csv(sample_data, "sample_data.csv", row.names = FALSE)
  data <- sample_data
  cat("No valid file provided. Using generated sample data and saved to 'sample_data.csv'\n")
} else {
  # Load the CSV file
  data <- read.csv(args[1])
  cat("Loaded data from:", args[1], "\n")
}

# Print summary statistics
cat("\n=== Summary Statistics ===\n")
print(summary(data))

# Print structure of data
cat("\n=== Data Structure ===\n")
str(data)

# Print first few rows
cat("\n=== First 6 Rows ===\n")
print(head(data))