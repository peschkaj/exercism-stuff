module Strain
        ( keep
        , discard
        )
where

discard :: (a -> Bool) -> [a] -> [a]
discard _ []       = []
discard p (x : xs) = if p x then discard p xs else x : discard p xs


keep :: (a -> Bool) -> [a] -> [a]
keep _ []       = []
keep p xs = discard (not . p) xs

