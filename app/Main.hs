module Main where

import qualified Day02 (countSafeReports, printSafeReports)
import System.IO (readFile)

-- Parse a single report into a list of integers
parseReport :: String -> [Int]
parseReport = map read . words

main :: IO ()
main = do
  input <- readFile "input/day02.txt"
  let reports = map parseReport (lines input)
  -- Day02.printSafeReports reports
  let safeCount = Day02.countSafeReports reports
  print safeCount
