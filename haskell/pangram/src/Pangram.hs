module Pangram (isPangram) where

import Data.Char
import Data.List

isPangram :: String -> Bool
isPangram text = letters == ['a'..'z']
  where letters = sort . uniq $ filter isAsciiLower $ map toLower text

uniq :: Eq a => [a] -> [a]
uniq = foldl (\acc item -> if item `elem` acc then acc else acc ++ [item]) []

