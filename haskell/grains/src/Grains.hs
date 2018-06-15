module Grains (square, total) where

import Data.Maybe
import Data.List

square :: Integer -> Maybe Integer
square n | n < 1     = Nothing
         | n > 64    = Nothing
         | otherwise = Just $ square' n
  where square' x | x == 1 = 1
                  | otherwise = 2 ^ (x - 1)

total :: Integer
total = sum . catMaybes $ fmap square [1..64]
