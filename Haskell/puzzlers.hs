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