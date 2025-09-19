# Load necessary library
library(readr)

# Load CSV file (replace 'data.csv' with your actual file path)
data <- read_csv("data.csv")

# Print summary statistics
summary(data)

# Print structure of the data
str(data)

# Print first few rows
head(data)