-- Function to compute the factorial of a number
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage:
-- factorial 5 -> 120
-- factorial 0 -> 1