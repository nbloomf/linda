module Linda.Utilities where

import Data.Maybe (catMaybes)
import Data.List

-- get all words with specified suffix
stemsWith :: String -> [String] -> [String]
stemsWith []  = id
stemsWith suf = catMaybes . map stripsuf
  where stripsuf = (fmap reverse) . (stripPrefix (reverse suf)) . reverse

-- get all stems which appear with given suffixes
commonStems :: [String] -> [String] -> [String]
commonStems []   _  = []
commonStems sufs ws =
  foldl1 intersect $ map (\suf -> stemsWith suf ws) sufs
