module Day01 (mySolution, parseInput) where

import Data.List (sort)

mySolution :: [Int] -> [Int] -> Int
mySolution leftList rightList = 
    let sortedLeft = sort leftList
        sortedRight = sort rightList
        distances = zipWith (\x y -> abs (x - y)) sortedLeft sortedRight
    in sum distances

-- Helper Functions
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