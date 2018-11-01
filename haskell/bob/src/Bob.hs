module Bob
        ( responseFor
        )
where

import           Data.Char

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
    where

        questionType :: String -> Query
        questionType xs | null word        = NoQuery
                        | (last word == '?') && not (isShout word) = Question
                        | last word == '?' = ShoutQuestion
                        | isShout word     = Shout
                        | otherwise        = EverythingElse
            where
                word = trim xs
                trim = unwords . words

        isShout :: String -> Bool
        isShout s | word == ""     = False
                  | all isUpper word = True
                  | otherwise      = False
                where word = filter isAlpha s
