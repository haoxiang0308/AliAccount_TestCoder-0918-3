-- Function to compute the factorial of a number
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Alternative implementation using fold
factorial' :: Integer -> Integer
factorial' n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = foldl (*) 1 [1..n]

-- Example usage:
-- factorial 5 returns 120
-- factorial 0 returns 1