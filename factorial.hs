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
  | otherwise = foldl (*) 1 [1..n]

-- Example usage
main :: IO ()
main = do
  putStrLn $ "Factorial of 5: " ++ show (factorial 5)
  putStrLn $ "Factorial of 0: " ++ show (factorial 0)
  putStrLn $ "Factorial of 10: " ++ show (factorial 10)