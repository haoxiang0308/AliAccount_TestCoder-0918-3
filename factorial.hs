-- Factorial function in Haskell
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Example usage
main :: IO ()
main = do
    putStrLn $ "Factorial of 5 is: " ++ show (factorial 5)
    putStrLn $ "Factorial of 0 is: " ++ show (factorial 0)