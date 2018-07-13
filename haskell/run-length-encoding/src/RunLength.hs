module RunLength (decode, encode) where

import Data.Char
import Data.List


decode :: String -> String
decode xs
  | all isLetter xs = xs
  | otherwise     = concatMap (\(n, [c]) -> replicate n c) $ groupsToTuples $ grouped xs
  where
    grouped :: String -> [String]
    grouped = groupBy (\x y -> all isDigit [x,y])

    groupsToTuples :: [String] -> [(Int, String)]
    groupsToTuples []  = []
    groupsToTuples [x] = [(1, x)]
    groupsToTuples (x : y : xs)
      | all isNumber x = (read x :: Int, y) : groupsToTuples xs
      | otherwise      = (1, x) : groupsToTuples (y : xs)

encode :: String -> String
encode [] = ""
encode (t:ts) = encode' t 1 ts
  where
    encode' :: Char -> Int -> String -> String
    encode' c n [] = showEnc c n
    encode' c n (x:xs)
      | c == x = encode' c (n + 1) xs
      | otherwise = showEnc c n ++ encode' x 1 xs
    showEnc c n
      | n > 1 = show n ++ [c]
      | otherwise = [c]
