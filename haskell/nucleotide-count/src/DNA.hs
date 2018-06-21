{-# LANGUAGE OverloadedStrings #-}

module DNA (nucleotideCounts) where

import Data.Map (Map, fromList, insertWith)

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs | all(`elem` allowed) xs = Right $ nCount xs
                    | otherwise         = Left "Invalid DNA strand"
  where
    allowed :: String
    allowed = "ACGT"


nCount :: String -> Map Char Int
nCount [] = fromList [ ('A', 0), ('C', 0) , ('G', 0) , ('T', 0)]
nCount (x:xs) = insertWith (+) x 1 $ nCount xs
