-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number [x]
  = x
number (x:xs)
  = (x * (10^ (length (x:xs) - 1))) + number xs
{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [a] -> [([a],[a])]
splits [x,y]
  = [([x],[y])]
splits (x:xs)
  = ([x],xs) : map addToSplit (splits xs)
    where addToSplit (z,y) = (x:z,y)

possibles :: [([Int],[Int])]
possibles
  = permutationSplits xs
    where xs = map (read::String->Int) (permutations "123456789")

permutationSplits :: [Int] -> [([Int],[Int])]
permutationSplits [x]
  = splits (digits x)
permutationSplits (x:xs)
  = splits (digits x) ++ permutationSplits xs

digits :: Int -> [Int]
digits 0
  = []
digits x
  = digits (x `div` 10) ++ [x `mod` 10]

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable ([],[])
  = False
isAcceptable (xs,ys)
  | lastDigitThree(min (number xs) (number ys)) && palindromeCheck (number xs * number ys) = True
  | otherwise = False
  

palindromeCheck :: Int -> Bool
palindromeCheck 0
  = False
palindromeCheck x
  | (head (digits x) == 4) && (reverse (digits x) == digits x) = True
  | otherwise = False

lastDigitThree :: Int -> Bool
lastDigitThree 0
  = False
lastDigitThree x
  |last (digits x) == 3 = True
  |otherwise = False


acceptables :: [([Int],[Int])]
acceptables
  = filter isAcceptable possibles

{-End Question 2.3-}

-- any main functions for testing goes here

main :: IO()
main =
  putStrLn(show(acceptables))