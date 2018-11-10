module Pangram (isPangram) where

import Data.Char
import Data.List

isPangram :: String -> Bool
isPangram text = letters == ['a'..'z']
  where letters = sort . nub $ filter isAsciiLower $ map toLower text

