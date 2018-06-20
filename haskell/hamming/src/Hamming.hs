module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance [] _  = Nothing
distance _ []  = Nothing
distance xs ys | length xs == length ys = Just $ sum [1 | (x,y) <- zip xs ys, x /= y]
               | otherwise = Nothing
