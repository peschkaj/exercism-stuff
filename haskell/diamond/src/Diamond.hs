module Diamond (diamond) where

import Data.Char

diamond :: Char -> Maybe [String]
diamond c | c =='A'   = Just ["A" :: String]
diamond c | otherwise = Just $ diamondUp (prevChar c) (distance - 1)
                               ++ row distance c
                               ++ diamondDown (prevChar c) (distance - 1)
  where distance = ord c - ord 'A'
        width = (2 * distance) + 1

        prevChar x | x > 'A'   = chr $ ord x - 1
                   | otherwise = '_'

        dots n = replicate n ' '

        row n char = [dots outer ++ [char] ++ dots inner ++ [char] ++ dots outer]
          where outer = distance - n
                inner = width - (2 * outer) - 2

        diamondUp :: Char -> Int -> [String]
        diamondUp myChar remain | remain == 0 = [dots distance ++ [myChar] ++ dots distance]
        diamondUp myChar remain | (remain > 0) && remain <= distance = diamondUp (prevChar myChar) (remain - 1)
                                                                       ++ row remain myChar
        diamondUp _ _ = [""]

        diamondDown :: Char -> Int -> [String]
        diamondDown myChar remain | remain == 0 = [dots distance ++ [myChar] ++ dots distance]
        diamondDown myChar remain | remain > 0 && remain <= distance = row remain myChar
                                                                       ++ diamondDown (prevChar myChar) (remain - 1)
        diamondDown _ _ = [""]
