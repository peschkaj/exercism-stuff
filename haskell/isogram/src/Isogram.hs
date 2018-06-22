module Isogram (isIsogram) where

import Data.Char (toLower)
import qualified Data.Map.Strict as M
-- convert to map
-- then fold over the map doing a sum of the values
-- check that sum == length

isIsogram :: String -> Bool
isIsogram xs = countSum == length chars
  where
    countChars :: String -> M.Map Char Int
    countChars [] = M.empty
    countChars (x:xs) | x == ' '  = countChars xs
                      | x == '-'  = countChars xs
                      | otherwise = M.insertWith (+) (toLower x) 1 $ countChars xs

    replaced = countChars xs
    chars = M.foldlWithKey f "" replaced
      where f result k _ = result ++ [k]
    countSum = M.foldr (+) 0 replaced
