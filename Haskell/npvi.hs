-- Test data

a :: [Int]
a = [2,5,1,3]

b :: [Int]
b = [1,3,6,2,5]

c :: [Int]
c = [4,4,2,1,1,2,2,4,4,8]

u :: [Int]
u = [2,2,2,2,2,2,2,2,2,2]

x :: [Int]
x = [1,9,2,8,3,7,2,8,1,9]

-------------------------------
-- Functions
-------------------------------


-------------------------------
-- pairwiseValues: Takes a list of Int values as its sole parameter, which 
--                 produces a list of pairs of Int values, such that each element 
--                 of the given list is paired with its successor

pairwiseValues :: [Int] -> [(Int, Int)]
pairwiseValues xs = zipWith (\x y -> (x,y)) xs ( tail xs )


-------------------------------
-- pairwiseDifferences: Takes a list of Int values as its sole parameter, 
--                      which produces a list of Int values consisting of 
--                      pairwise differences of each element in the list 
--                      with its successor

pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences xs = map ( \(x,y) -> x - y ) ( pairwiseValues xs )


-------------------------------
-- pairwiseSums: Takes a list of Int values as its sole parameter, 
--                      which produces a list of Int values consisting of 
--                      pairwise sums of each element in the list 
--                      with its successor

pairwiseSums :: [Int] -> [Int]
pairwiseSums xs = map ( \(x,y) -> x + y ) ( pairwiseValues xs )


half :: Int -> Double
half number = ( fromIntegral number ) / 2


-------------------------------
-- pairwiseHalves: Takes a list of Int values as its sole parameter, 
--                 which produces a list of Double values by dividing 
--                 each value in the input list by 2

pairwiseHalves :: [Int] -> [Double]
pairwiseHalves xs = map half xs


-------------------------------
-- pairwiseHalfSums: Takes a list of Int values as its sole parameter, 
--                   which produces a list of Double values by dividing 
--                   each pairwise sum by 2

pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums xs = pairwiseHalves ( pairwiseSums xs )


-------------------------------
-- pairwiseTermPairs: Takes a list of Int values as its sole parameter, 
--                    which produces a list of pairs corresponding to the 
--                    numerators/denominator in the summation of the nPVI formula.

pairwiseTermPairs :: [Int] -> [(Int,Double)]
pairwiseTermPairs xs = zip ( pairwiseDifferences xs ) ( pairwiseHalfSums xs )


-------------------------------
-- term: Transforms a given “(numerator,denominator) pair” into an evaluated 
--       term for the summation operation

term :: (Int,Double) -> Double
term ndPair = abs ( fromIntegral ( fst ndPair ) / ( snd ndPair ) )


-------------------------------
-- pairwiseTerms: Takes a list of Int values as its sole parameter, which 
--                produces a list of Double values corresponding to the 
--                terms in the summation of the nPVI formula

pairwiseTerms :: [Int] -> [Double]
pairwiseTerms xs = map term ( pairwiseTermPairs xs ) 


-------------------------------
-- nPVI: The final nPVI calculation

nPVI :: [Int] -> Double
nPVI xs = normalizer xs * sum ( pairwiseTerms xs )
    where normalizer xs = 100 / fromIntegral ( ( length xs ) - 1 )