module Raindrops (convert) where

convert :: Int -> String
convert n | str == "" = show n
          | otherwise = str
  where str = concat $ zipWith f [3,5,7] ["Pling", "Plang", "Plong"]
        f digit message | mod n digit == 0 = message
                        | otherwise        = ""
