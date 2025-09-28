-- Module containing utility functions for lists
module MyListUtils where

-- Function to calculate the length of a list using recursion
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs