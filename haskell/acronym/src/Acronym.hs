module Acronym
  ( abbreviate
  ) where

import Data.Char
import Data.List.Split

abbreviate :: String -> String
abbreviate = concatMap (fmap toUpper . collect) . splitOneOf " -"
   where collect wd | null uppers = pure $ head wd
                    | otherwise   = uppers
           where uppers | all isUpper wd = pure (head wd)
                        | otherwise      = filter isUpper wd
