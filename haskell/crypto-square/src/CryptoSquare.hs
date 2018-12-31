module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split (chunksOf)
import Data.List (transpose)

encode :: String -> String
encode = unwords . transpose . plaintextSegments

normalizeText :: String -> String
normalizeText = map toLower . filter isAlphaNum

squareSize :: String -> Int
squareSize text = ceiling $ sqrt (fromIntegral l :: Double)
  where l = length $ normalizeText text

plaintextSegments :: String -> [String]
plaintextSegments text = chunksOf ss t
  where ss = squareSize text
        t  = normalizeText text
