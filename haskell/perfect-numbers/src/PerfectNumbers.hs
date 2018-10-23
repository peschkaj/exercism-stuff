module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n | n <= 0 = Nothing
           | otherwise = case compare n aliquotSum of EQ -> Just Perfect
                                                      GT -> Just Deficient
                                                      LT -> Just Abundant
  where
    aliquotSum = aliquot n
    aliquot = sum . factors
    factors n = filter (`isFactorOf` n) [1 .. n `div` 2]
    isFactorOf x n = n `mod` x == 0
