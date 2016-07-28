module Main where

import System.Exit (exitSuccess)
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let as = map toRegex $ commonStems ["","er","est"] ws
             where toRegex w = "^" ++ w ++ "(er|est)?$"

  let bs = map toRegex $ commonStems ["","r","st"] ws
             where toRegex w = "^" ++ w ++ "(r|st)?$"

  let cs = map toRegex $ commonStems ["y","ier","iest"] ws
             where toRegex w = "^" ++ w ++ "(y|ier|iest)$"

  sequence $ map putStrLn $ concat [as, bs, cs]

  exitSuccess
