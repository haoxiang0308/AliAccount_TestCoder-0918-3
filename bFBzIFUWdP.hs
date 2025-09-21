-- Factorial function in Haskell
-- Using recursion

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Example usage:
-- factorial 5 = 120
-- factorial 0 = 1