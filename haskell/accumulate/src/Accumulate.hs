module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate f xs = [f x | x <- xs]
