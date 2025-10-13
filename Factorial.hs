-- Function to compute the factorial of a non-negative integer
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage:
-- factorial 5
-- factorial 0