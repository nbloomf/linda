module Main where

import System.Exit (exitSuccess)
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let as = map toRegex $ commonStems ["","s"] ws
             where toRegex w = "^" ++ w ++ "(s|\'s|s\')?$"

  let bs = map toRegex $ commonStems ["y","ies"] ws
             where toRegex w = "^" ++ w ++ "(y|ies|y\'s|ies\')?$"

  let cs = map toRegex $ commonStems ["x","ces"] ws
             where toRegex w = "^" ++ w ++ "(x|ces|x\'s|ces\')?$"

  sequence $ map putStrLn $ concat [as,bs,cs]

  exitSuccess
