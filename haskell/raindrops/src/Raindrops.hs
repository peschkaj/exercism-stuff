module Raindrops (convert) where


convert :: Int -> String
convert n | drops factors == "" = show n
          | otherwise           = drops factors
  where factors = filter (`isFactorOf` n) [1 .. n]
        isFactorOf x y = y `mod` x == 0
        drops (x:xs) | x == 3    = "Pling" ++ drops xs
                     | x == 5    = "Plang" ++ drops xs
                     | x == 7    = "Plong" ++ drops xs
                     | otherwise = drops xs
        drops []                 = ""
