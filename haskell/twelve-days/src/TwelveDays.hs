{-# LANGUAGE OverloadedStrings #-}

module TwelveDays
  ( recite
  ) where

recite :: Int -> Int -> [String]
recite start stop = [verse d | d <- [start..stop], d >= start]
  where
    verse day = "On the " ++ days !! (day - 1) ++ " day of Christmas my true love gave to me, "
                ++ dayGifts day

    dayGifts day | day == 1 = "a Partridge in a Pear Tree."
                 | otherwise = concat $ reverse $ take day gifts

    gifts =
      [ "and a Partridge in a Pear Tree."
      , "two Turtle Doves, "
      , "three French Hens, "
      , "four Calling Birds, "
      , "five Gold Rings, "
      , "six Geese-a-Laying, "
      , "seven Swans-a-Swimming, "
      , "eight Maids-a-Milking, "
      , "nine Ladies Dancing, "
      , "ten Lords-a-Leaping, "
      , "eleven Pipers Piping, "
      , "twelve Drummers Drumming, "
      ]

    days =
      [ "first"
      , "second"
      , "third"
      , "fourth"
      , "fifth"
      , "sixth"
      , "seventh"
      , "eighth"
      , "ninth"
      , "tenth"
      , "eleventh"
      , "twelfth"
      ]
