module IsbnVerifier (isbn) where

import Data.Sequence (mapWithIndex, fromList)
import Data.Char (isDigit, digitToInt)
import Data.List (elemIndex)

isbn :: String -> Bool
isbn xs | not validXPosition              = False
        | length (formattedIsbn xs) == 10 = valid . checksum $ formattedIsbn xs
        | otherwise                       = False
  where
    validXPosition = case elemIndex 'X' (formattedIsbn xs) of Nothing -> True
                                                              Just x  -> x == 9

    formattedIsbn :: String -> String
    formattedIsbn = filter (\x -> isDigit x || x == 'X') . filter(/= '_')

    checksum :: String -> Int
    checksum ds = sum $ mapWithIndex (\idx x -> (10 - idx) * x) $ fromList $ toDigits ds

    toDigits :: String -> [Int]
    toDigits [] = []
    toDigits (d:ds) | isDigit d = digitToInt d : toDigits ds
                    | d == 'X'  = 10 : toDigits ds
                    | otherwise = 0 : toDigits ds

    valid :: Int -> Bool
    valid n = n `mod` 11 == 0
