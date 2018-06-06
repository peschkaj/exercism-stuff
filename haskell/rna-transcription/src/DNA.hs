module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA xs | null xs                                 = Nothing
         | not $ all (`elem` ['A', 'C', 'T', 'G']) xs = Nothing
         | otherwise                               = Just $ toRNA' xs
  where toRNA' [] = []
        toRNA' (d:ds) = case d of 'G' -> 'C' : toRNA' ds
                                  'C' -> 'G' : toRNA' ds
                                  'T' -> 'A' : toRNA' ds
                                  'A' -> 'U' : toRNA' ds
                                  _   -> error "That's not DNA"
