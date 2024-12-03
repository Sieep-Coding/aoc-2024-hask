module Main where

import qualified MyLib (someFunc)
import qualified Day01 (mySolution)

main :: IO ()
main = do
  MyLib.someFunc
  MyLib.mySolution
