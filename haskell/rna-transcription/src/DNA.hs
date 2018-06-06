module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM toRNA'
  where toRNA' :: Char -> Maybe Char
        toRNA' 'G' = Just 'C'
        toRNA' 'C' = Just 'G'
        toRNA' 'T' = Just 'A'
        toRNA' 'A' = Just 'U'
        toRNA'  _  = Nothing
