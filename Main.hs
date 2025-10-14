module Main where

import MyLib (listLength)

main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    putStrLn $ "The length of the list is: " ++ show (listLength testList)
