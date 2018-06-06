module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (`divByAny` factors) [1..end]
  where end = limit - 1
        divBy x y = x `rem` y == 0
        divByAny n = any (n `divBy`)
