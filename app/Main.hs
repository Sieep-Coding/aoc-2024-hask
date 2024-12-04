module Main where

import System.IO (readFile)
import qualified Day01 (parseInput, mySolution)

main :: IO ()
main = do
  input <- System.IO.readFile "input/day01.txt"
  let (leftList, rightList) = Day01.parseInput input
  let result = Day01.mySolution leftList rightList
  print result