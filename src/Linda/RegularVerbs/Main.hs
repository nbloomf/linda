module Main where

import System.Exit (exitSuccess)
import Data.List
import Linda.Utilities

main :: IO ()
main = do
  ws <- fmap words getContents

  let as = map toRegex $ commonStems ["e","es","ed","ing"] ws
             where toRegex w = "^" ++ w ++ "(e|es|ed|ing)$"

  let bs = map toRegex $ commonStems ["","s","ed","ing"] ws
             where toRegex w = "^" ++ w ++ "(s|ed|ing)?$"

  let cs = map toRegex $ commonStems ["y","ies","ied","ying"] ws
             where toRegex w = "^" ++ w ++ "(y|ies|ied|ying)$"

  let ds = map toRegex $ commonStems ["","es","ed","ing"] ws
             where toRegex w = "^" ++ w ++ "(es|ed|ing)?$"

  let es = map toRegex $ commonStems ["","s","d","ing"] ws
             where toRegex w = "^" ++ w ++ "(s|d|ing)?$"

  let fs x = map toRegex $ commonStems ["","s",x:"ed",x:"ing"] ws
             where toRegex w = "^" ++ w ++ "(s|" ++ [x] ++ "ed|" ++ [x] ++ "ing)?$"

  sequence $ map putStrLn $ concat
    [as, bs, cs, ds, es, fs 'n', fs 'g', fs 't']

  exitSuccess
