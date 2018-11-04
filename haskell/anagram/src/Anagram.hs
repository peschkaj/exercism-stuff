module Anagram
  ( anagramsFor
  )
where

import           Data.Char                      ( toLower )
import           Data.List                      ( sort )

anagramsFor :: String -> [String] -> [String]
anagramsFor word = filter (isAnagram word)
 where
  isAnagram :: String -> String -> Bool
  isAnagram w other | lowercase w == lowercase other = False
                    | sw w == sw other               = True
                    | otherwise                      = False

  sw :: String -> String
  sw w = sort $ lowercase w

  lowercase :: String -> String
  lowercase ws = [ toLower w | w <- ws ]

