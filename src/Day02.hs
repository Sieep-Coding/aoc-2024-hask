module Day02 (countSafeReports, printSafeReports) where

import Debug.Trace (trace)

-- Check if a report is safe
isSafe :: [Int] -> Bool
isSafe levels = isStrictlyIncreasingOrDecreasing levels && allValidDiffs levels

-- Check if the levels are either strictly increasing or strictly decreasing
isStrictlyIncreasingOrDecreasing :: [Int] -> Bool
isStrictlyIncreasingOrDecreasing (x : y : xs) =
  let diffs = zipWith (-) (y : xs) (x : xs)
  in (all (> 0) diffs) || (all (< 0) diffs) -- Strictly increasing or strictly decreasing
isStrictlyIncreasingOrDecreasing _ = False

-- Check if the difference between adjacent levels is between 1 and 3
allValidDiffs :: [Int] -> Bool
allValidDiffs (x : y : xs) = 
  let diff = abs (y - x)
  in if diff < 1 || diff > 3 
     then trace ("Invalid diff: " ++ show diff ++ " between " ++ show x ++ " and " ++ show y) False
     else allValidDiffs (y : xs)
allValidDiffs _ = True

-- Main function to process all reports and print debug info
countSafeReports :: [[Int]] -> Int
countSafeReports reports = 
    let safeReports = filter isSafe reports
    in length safeReports

-- For debugging purposes, call this to print safe reports
printSafeReports :: [[Int]] -> IO ()
printSafeReports reports = do
    let safeReports = filter isSafe reports
    mapM_ (putStrLn . show) safeReports
