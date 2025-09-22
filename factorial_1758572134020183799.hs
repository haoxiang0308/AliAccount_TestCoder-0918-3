-- Factorial function in Haskell
-- Using recursion

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Alternative implementation using pattern matching and guards
factorial' :: Integer -> Integer
factorial' n
  | n < 0 = error "Factorial is not defined for negative numbers"
  | n == 0 = 1
  | otherwise = n * factorial' (n - 1)

-- Example usage:
-- factorial 5
-- Result: 120