module Main where

import System.Exit (exitSuccess)
import Data.List (isSuffixOf, stripPrefix)
import Data.Maybe (catMaybes)
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let xs = stemsWith "ly" ws

  let ys = map toRegex $ filter (`elem` ws) xs

  sequence $ map putStrLn ys

  exitSuccess

toRegex :: String -> String
toRegex w = "^" ++ w ++ "(ly)?$"
