module Acronym
  ( abbreviate
  ) where

import Data.Char
import Data.List.Split

abbreviate :: String -> String
abbreviate xs = concatMap letters ws
  where
    ws = filter (not . null) $ splitOneOf " ,-" xs
    letters w =
      if c
        then [first]
        else first : filtered
      where
        c = length (tail w) == length filtered
        filtered = filter isUpper $ tail w
        first = toUpper $ head w
