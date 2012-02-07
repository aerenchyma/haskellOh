--- bear with me. (jzc)

--- attempts at 99 Haskell problems (http://www.haskell.org/haskellwiki/99_questions/1_to_10 etc)
-- these won't have much of an order -- stuff I'm going through to get used to Haskell

-- def'n of infix operator in Prelude:
{-
(!!) :: [a] -> Int -> a
(x:_) !! 0 = x
(_:xs) !! n = xs !! (n-1)
-}


-- find the number of elements in a list:
myLength :: [a] -> Int -- (err A:) doing [a] -> Int -> a   ==> this whole fxn won't compile
myLength [] = 0
myLength (_:xs) = 1 + (myLength xs) -- error msg will appear here (err A)