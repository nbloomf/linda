module Main where

import System.Exit (exitSuccess)
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let as = map toRegex $ commonStems ["","s"] ws
             where toRegex w = "^" ++ w ++ "(s|\'s|s\')?$"

  sequence $ map putStrLn $ concat [as]

  exitSuccess
