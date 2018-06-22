module Isogram (isIsogram) where

import Data.Char (isAlpha, toLower)
import Data.List (sort, group)


isIsogram :: String -> Bool
isIsogram = all ((== 1) . length) . group . sort . map toLower . filter isAlpha
