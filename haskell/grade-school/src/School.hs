module School (School, add, empty, grade, sorted) where

import Data.List (sort)
import qualified Data.Map as M

newtype School = School (M.Map Int [String])

add :: Int -> String -> School -> School
add gradeNum student (School s) = School $ M.insertWith sortedInsert gradeNum [student] s
  where sortedInsert x xs = sort (x ++ xs)

empty :: School
empty = School M.empty

grade :: Int -> School -> [String]
grade gradeNum (School ss) = M.findWithDefault [] gradeNum ss

sorted :: School -> [(Int, [String])]
sorted (School s) = M.toList s
