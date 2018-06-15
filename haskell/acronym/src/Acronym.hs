module Acronym
  ( abbreviate
  ) where

import Data.Char
import Data.List.Split

abbreviate :: String -> String
abbreviate = concatMap (fmap toUpper . collect) . splitOneOf " -"
   where collect wd = if null uppers then pure (head wd) else uppers
           where uppers = if all isUpper wd then pure (head wd) else filter isUpper wd
