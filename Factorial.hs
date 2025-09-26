-- | This module provides a function to calculate the factorial of a non-negative integer.
module Factorial where

-- | Calculates the factorial of a non-negative integer.
--   The factorial of n (n!) is the product of all positive integers less than or equal to n.
--   For example, factorial 5 = 5 * 4 * 3 * 2 * 1 = 120.
--
--   This function uses recursion.
--   It is defined for non-negative integers. Calling it with a negative number will result in infinite recursion.
factorial :: Integer -> Integer
factorial n
  | n <= 1    = 1
  | otherwise = n * factorial (n - 1)
