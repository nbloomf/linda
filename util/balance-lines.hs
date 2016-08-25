#!/usr/bin/runhaskell

{- Check lines on stdin for unbalanced delimiters. -}

import Data.List (lines)

main :: IO ()
main = do
  input <- fmap (zip [1..] . lines) getContents
  sequence_ $ map checkLine input
  return ()

checkLine :: (Int, String) -> IO ()
checkLine (k,str) =
  if not $ isBalanced ('(',')') str
    then do
      putStrLn $ "Unbalanced '(' or ')'."
      putStrLn $ show k ++ " : " ++ str
    else if not $ isBalanced ('{','}') str
      then do
        putStrLn $ "Unbalanced '{' or '}'."
        putStrLn $ show k ++ " : " ++ str
      else if not $ isBalanced ('[',']') str
        then do
          putStrLn $ "Unbalanced '[' or ']'."
          putStrLn $ show k ++ " : " ++ str
        else return ()

isBalanced :: (Eq a) => (a,a) -> [a] -> Bool
isBalanced (open, close) line = isBalanced' 0 line
  where
    isBalanced' k [] = k == 0
    isBalanced' k (x:xs)
      | x == open            = isBalanced' (k+1) xs
      | x == close && k > 0  = isBalanced' (k-1) xs
      | x == close && k <= 0 = False
      | otherwise            = isBalanced' k xs
