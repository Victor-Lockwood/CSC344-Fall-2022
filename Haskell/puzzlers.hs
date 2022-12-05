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
