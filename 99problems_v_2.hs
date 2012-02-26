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

-- reverse a list
reverseList :: [a] -> [a]
reverseList [] = []
reverseList [x] = [x]
reverseList (x:xs) = reverseList xs ++ [x]

--- the less wasteful solution (per http://www.haskell.org/haskellwiki/99_questions/Solutions/5):
reverseList' :: [a] -> [a]
reverseList' list = reverseList' list []
	where
		reverseList' [] reversed = reversed
		reverseList' (x:xs) reversed = reverseList' xs (x:reversed)

-- find out whether a list is a palindrome
isPal :: [a] -> Bool
isPal [] = True
isPal [_] = True
isPal xs = (xs == (reverseList' xs)) -- what specifically is wrong with these things?
	-- A: improper use of what should be currying

---- so here are some solutions that are more correct
-- [from http://www.haskell.org/haskellwiki/99_questions/Solutions/6 + adapted]
isPal' :: (Eq a) => [a] -> Bool
isPal' xs = xs == (reverse xs)

isPal'' [] = True
isPal'' [_] = True
isPal'' xs = (head xs) == (last xs) && (isPal'' $ init $ tail xs) -- so the $, what does that do?

-- this one should be gone through line by line.. (2012.02.07)
palThing :: (Eq a) => [a] -> Bool
palThing xs = p [] xs xs
	where p rev (x:xs) (_:_:ys) = p (x:rev) xs ys
		  p rev (x:xs) [_] = rev == xs
		  p rev xs [] = rev == xs


{-
isPal (x:xs) = True
	if
		reverseList' (x:xs) = (x:xs)
isPal (x:xs) = False
	if reverseList' (x:xs) /= (x:xs)
-}



{-
max 4 5
--is the same as
(max 4) 5
-- and both have 'output' 5

-- putting a space between 2 things  == function application
-}


