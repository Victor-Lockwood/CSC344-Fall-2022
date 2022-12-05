-------------------------------
-- File: puzzlers.hs
-------------------------------


-------------------------------
-- reverseWords: Takes a character string of words
-- and returns a string containing those words in reverse order

reverseWords :: String -> String
reverseWords wordString = ( unwords ( reverse ( words wordString ) ) )


-------------------------------
-- averageWordLength: Takes a string of words and returns the average word length 

averageWordLength :: Fractional a => String -> a
averageWordLength wordString = 
    (fromIntegral ( sum ( map length ( wordList ) ) ) ) 
    / (fromIntegral (length wordList) )
    
    where wordList = words wordString


-------------------------------
-- RECURSION
-------------------------------


-------------------------------
-- list2set: Takes a list of objects with duplicates removed

list2set [] = []
list2set (x:xs) = 
    if (x `elem` xs) 
        then list2set xs
    else x: list2set xs


-------------------------------
-- isPalindrome: Returns true if the input list is a palindrome

isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs) =
    if (x == (last xs))
    then isPalindrome (init xs) 
    else False


-------------------------------
-- collatz: Returns the collatz sequence for a given positive integer

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz x = 
    if (odd x)
    then x : collatz (3 * x + 1)
    else x : collatz (div x 2)


-------------------------------
-- LIST COMPREHENSIONS
-------------------------------


-------------------------------
-- count: Returns the number of times the indicated object appears in a list

count e l = length [ x | x <- l, x == e]


-------------------------------
-- freqTable: Returns a list of ordered pairs of each element and the number of times they appear in a list

freqTable list = [(e, count e list) | e <- list2set list]


-------------------------------
-- HIGHER ORDER FUNCTIONS
-------------------------------


-------------------------------
-- tgl: Returns the triangular number for a given positive Int input

tgl n = foldl (+) 0 [1..n]


-------------------------------
-- triangleSequence: Returns a list of triangular numbers from 1 to the given positive Int input

triangleSequence n = map tgl [1..n]


-------------------------------
-- vowelCount: Returns the number of vowels that appear in a given list of lowercase letters

vowelCount word = length $ filter (\x -> x `elem` "aeiou") word


-------------------------------
-- lcsim: Takes a function for mapping, a predicate for filtering and a list of elements.  
--        Output is equivalent to that of [ f x | x <- xs, p x ]

lcsim f p xs = map f (filter p xs)
