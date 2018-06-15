module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x | x <= 0 = Nothing
           | otherwise = case aliquotSum of as | as == x   -> Just Perfect
                                               | as > x    -> Just Abundant
                                               | otherwise -> Just Deficient
  where aliquotSum = aliquot x

        aliquot :: Int -> Int
        aliquot = sum . factors

        factors :: Int -> [Int]
        factors n = filter (`isFactorOf` n) [1 .. n `div` 2]

        isFactorOf :: Integral a => a -> a -> Bool
        isFactorOf x n = n `mod` x == 0
