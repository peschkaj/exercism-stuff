module ETL (transform) where

import qualified Data.Map as M
import Data.Char (toLower)

transform :: M.Map a String -> M.Map Char a
transform = M.foldrWithKey f M.empty
  where
    f :: a -> String -> M.Map Char a -> M.Map Char a
    f k (x:xs) m = M.insert (toLower x) k (f k xs m)
    f _ [] m     = m
