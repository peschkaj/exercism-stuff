module Phone (number) where

import Data.Char
import Data.Sequence (mapWithIndex, fromList)

number :: String -> Maybe String
number [] = Nothing
number xs = pn $ filter isDigit xs
  where
    pn [] = Nothing
    pn ds@(y:ys)  | y == '1' = pn ys
                  | valid ds && length ds == 10 = Just ds
                  | otherwise = Nothing

    valid ds = all (== True) $ mapWithIndex checkDigit $ fromList ds

    checkDigit pos d | pos == 0 && d < '2' = False
                     | pos == 3 && d < '2' = False
                     | otherwise = True
