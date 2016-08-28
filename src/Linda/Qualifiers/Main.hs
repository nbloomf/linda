module Main where

import System.Exit (exitSuccess)
import Data.List (isSuffixOf, stripPrefix)
import Data.Maybe (catMaybes)
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let as = map toRegex $ commonStems ["", "ly"] ws
             where toRegex w = "^" ++ w ++ "(ly)?$"

  let bs = map toRegex $ commonStems ["", "ally"] ws
             where toRegex w = "^" ++ w ++ "(ally)?$"

  sequence $ map putStrLn $ concat [as, bs]

  exitSuccess
