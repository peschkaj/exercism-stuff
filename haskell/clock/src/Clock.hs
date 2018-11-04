{-# LANGUAGE InstanceSigs #-}
module Clock
        ( addDelta
        , fromHourMin
        , toString
        )
where

import           Text.Printf

newtype Clock = Clock Int

instance Eq Clock where
  -- Rather than have the clock constantly correct itself in order to make
  -- comparisons work, I just deal with the time as if it were a string.
  -- It's an extra computational step, but the modulo work is kept in one
  -- place
  (==) :: Clock -> Clock -> Bool
  (==) a b = toString a == toString b

  (/=) :: Clock -> Clock -> Bool
  (/=) a b = not (a == b)

fromHourMin :: Int -> Int -> Clock
fromHourMin hours minutes = Clock (minutes + hoursToMinutes hours)

toString :: Clock -> String
toString (Clock c) = printf "%02d:%02d" hours minutes
    where
        (h, minutes) = divMod c 60
        hours        = h `mod` 24

addDelta :: Int -> Int -> Clock -> Clock
addDelta hours minutes (Clock c) = Clock (c + minutes + hoursToMinutes hours)

hoursToMinutes :: Int -> Int
hoursToMinutes h = 60 * h
