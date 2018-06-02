module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x | x < 1     = Nothing
          | otherwise = Just $ collatz' x

collatz' :: Integer -> Integer
collatz' 1 = 0
collatz' n | even n    = 1 + collatz' (n `div` 2)
           | otherwise = 1 + collatz' (n * 3 + 1)
