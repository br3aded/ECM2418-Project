-- any imports go here

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits 0
  = []
digits x
  = digits (x `div` 10) ++ [x `mod` 10] 
{-End Question 1.1-}

{-Begin Question 1.2-}
isPar :: Int -> Bool
isPar x
  | (isMultiple x && isUnique (digits x)) == True = True
  | otherwise = False

isMultiple :: Int -> Bool
isMultiple a
  | (a `mod` 100) `mod` (a `div` 100) == 0 = True
  | otherwise = False

isUnique :: [Int] -> Bool
isUnique []
  = True
isUnique (x:xs)
  |elem x xs  == False = isUnique xs
  |otherwise = False

pars :: [Int]
pars
  = filter (\x -> (isPar x == True) && (elem 0 (digits x) == False)) [1000..9999]
  

{-End Question 1.2-}

{-Begin Question 1.3-}
isParty :: (Int, Int) -> Bool
isParty (x,y)
  | (isUnique (concatDigit (x,y))) && (isMultipleParty (x,y)) == True = True
  | otherwise = False

missingNum :: [Int] -> [Int]-> Int
missingNum (x:xs) ys
  | elem x ys == False = x 
  | otherwise = missingNum xs ys

isMultipleMissing :: (Int,Int) -> Int -> Bool
isMultipleMissing (x,y) z
  | (x `mod` z == 0) && (y`mod` z == 0) = True
  | otherwise = False

isMultipleParty :: (Int,Int) -> Bool
isMultipleParty (x,y)
  = isMultipleMissing (x,y) (missingNum [1..9] (concatDigit (x,y)))

concatDigit :: (Int,Int) -> [Int]
concatDigit (x,y)
  = (digits x) ++ (digits y)


partys :: [(Int, Int)]
partys 
  = filter isParty parCombinations

parCombinations :: [(Int,Int)]
parCombinations
  = combinations pars

combinations :: [Int] -> [(Int,Int)]
combinations []
  = []
combinations (x:xs)
  = combine x xs ++ combinations xs

combine :: Int -> [Int] -> [(Int,Int)]
combine x []
  = []
combine x (y:ys)
  = (x,y) : combine x ys

{-End Question 1.3-}

-- any main functions for testing goes here

main :: IO()
main
  = putStrLn(show(partys))