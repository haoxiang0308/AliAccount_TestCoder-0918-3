-- Main module to test the myLength function
module Main where

import MyListUtils

main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    putStrLn $ "The length of the list is: " ++ show (myLength testList)