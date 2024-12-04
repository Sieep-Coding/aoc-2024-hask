module Day01 (mySolution, parseInput, similarityScore, countInRight) where

import Data.List (sort)

-- Part 1
mySolution :: [Int] -> [Int] -> Int
mySolution leftList rightList = 
    let sortedLeft = sort leftList
        sortedRight = sort rightList
        distances = zipWith (\x y -> abs (x - y)) sortedLeft sortedRight
    in sum distances

-- Part 2
similarityScore :: [Int] -> [Int] -> Int
similarityScore leftList rightList =
    sum [x * countInRight x rightList | x <- leftList]

-- Helper Functions (Part 1)
parseInput :: String -> ([Int], [Int])
parseInput input =
    let rows = lines input
        pairs = map parseRow rows
        (leftList, rightList) = unzip pairs
    in (leftList, rightList)

parseRow :: String -> (Int, Int)
parseRow row =
    case words row of
        [l, r] -> (read l, read r)
        _ -> error $ "invalid row format" ++row

-- Helper Functions (Part 2)
countInRight :: Int -> [Int] -> Int
countInRight x rightList = length (filter (== x) rightList)