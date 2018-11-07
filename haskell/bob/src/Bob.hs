module Bob
        ( responseFor
        )
where

import           Data.Char
import           Data.List                      ( isSuffixOf )

data Query = Question
           | Shout
           | ShoutQuestion
           | NoQuery
           | EverythingElse
  deriving(Show)

responseFor :: String -> String
responseFor xs = case questionType xs of
        Question       -> "Sure."
        Shout          -> "Whoa, chill out!"
        ShoutQuestion  -> "Calm down, I know what I'm doing!"
        NoQuery        -> "Fine. Be that way!"
        EverythingElse -> "Whatever."

questionType :: String -> Query
questionType xs | isSilent word                         = NoQuery
                | isQuestion word && not (isShout word) = Question
                | isQuestion word                       = ShoutQuestion
                | isShout word                          = Shout
                | otherwise                             = EverythingElse
        where word = unwords $ words xs

isSilent :: String -> Bool
isSilent = null

isQuestion :: String -> Bool
isQuestion q = "?" `isSuffixOf` filter isPunctuation q

isShout :: String -> Bool
isShout s | word == ""     = False
          | all isUpper word = True
          | otherwise      = False
        where word = filter isAlpha s
